import assert from 'node:assert/strict';
import {execFileSync} from 'node:child_process';
import {mkdirSync,readFileSync,writeFileSync} from 'node:fs';
const run=(...args)=>execFileSync(process.env.STD_QUERY_CLI||'calcit',args,{encoding:'utf8',maxBuffer:20*1024*1024,stdio:['ignore','pipe','ignore']});
const q=(...args)=>JSON.parse(run('query',...args,'--format','json')).data;
mkdirSync('acceptance',{recursive:true});
function inventory(){
  const defs=[];
  for(const ns of q('ns').namespaces){
    const names=run('query','defs',ns).split('\n').filter(l=>/^  \S/.test(l)).map(l=>l.trim().split(' ')[0]);
    assert.equal(names.length,q('ns',ns).definition_count);
    for(const name of names)defs.push(q('def',`${ns}/${name}`));
  }
  return defs;
}
if(process.argv[2]==='inventory'){
  const defs=inventory();writeFileSync('acceptance/reviewed.json',JSON.stringify(defs,null,2));
  console.log(JSON.stringify({definitions:defs.length,tests:defs.reduce((n,d)=>n+d.tests.length,0),namespaces:q('ns').namespaces}));process.exit(0);
}
assert.equal(run('-v').trim(),'0.30.1');run('docs','agents','--full');
const before=inventory(),config=q('config');assert.deepEqual(before,JSON.parse(readFileSync('acceptance/reviewed.json','utf8')));
const expected=structuredClone(before),matches=q('search','^count$','--regex','--source','project');
assert.equal(matches.summary.matches,3);assert.equal(matches.summary.definitions,2);
const ops=[];
for(const d of matches.definitions){
  assert.ok(['calcit.std.test.fs/main!','calcit.std.test.rand/main!'].includes(d.id));
  const definition=expected.find(x=>x.id===d.id);
  for(const match of d.matches){
    assert.equal(match.tree,'count');assert.equal(match.node_kind,'call');
    const path=match.path.replace(/^code@/,'@'),indices=path.slice(1).split('.').map(Number);
    let node=definition.code;
    for(const i of indices.slice(0,-1))node=node[i];
    const i=indices.at(-1);assert.equal(node[i],'count');node[i]='.len';
    ops.push(['tree','replace',d.id,'--path',path,'--input-format','json-ast','--code',JSON.stringify('.len'),'--expect','quote count']);
  }
}
writeFileSync('acceptance/before.json',JSON.stringify(before,null,2));
writeFileSync('acceptance/operations.json',JSON.stringify(ops,null,2));
const args=['edit','transaction','--file','acceptance/operations.json','--format','json'];
const preview=JSON.parse(run(...args,'--dry-run'));assert.ok(preview.scoped_revision);
writeFileSync('acceptance/preview.json',JSON.stringify(preview,null,2));writeFileSync('acceptance/applied.json',run(...args,'--expect-revision',preview.scoped_revision));
assert.deepEqual(inventory(),expected,'Only3source call heads; every test/assertion/schema/FFI/doc/tag unchanged');assert.deepEqual(q('config'),config);
writeFileSync('acceptance/after.json',JSON.stringify(expected,null,2));writeFileSync('acceptance/snapshot-blob.txt',execFileSync('git',['hash-object','calcit.cirru'],{encoding:'utf8'}));
console.log(JSON.stringify({definitions:expected.length,calls:ops.length,changedDefinitions:2}));
