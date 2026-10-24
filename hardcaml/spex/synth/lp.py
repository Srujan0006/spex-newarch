import json,sys,collections
d=json.load(open('net.json'))
m=d['modules']['spex_core']
names=collections.defaultdict(list)
for n,v in m['netnames'].items():
    for b in v['bits']:
        if isinstance(b,int): names[b].append(n)
drv={}; ins=collections.defaultdict(list)
cells=m['cells']
for cn,c in cells.items():
    t=c['type']
    for p,bits in c['connections'].items():
        dirn=c['port_directions'][p]
        for b in bits:
            if not isinstance(b,int): continue
            if dirn=='output': drv[b]=(cn,t)
seqtypes=lambda t: 'DFF' in t or 'dff' in t.lower() or 'mem' in t.lower()
memo={}
sys.setrecursionlimit(100000)
def depth(b):
    if b in memo: return memo[b]
    if b not in drv: memo[b]=(0,None); return memo[b]
    cn,t=drv[b]
    if seqtypes(t): memo[b]=(0,None); return memo[b]
    c=cells[cn]; best=(0,None)
    for p,bits in c['connections'].items():
        if c['port_directions'][p]=='input':
            for x in bits:
                if isinstance(x,int):
                    dd=depth(x)[0]
                    if dd>=best[0]: best=(dd,x)
    memo[b]=(best[0]+1,best[1]); return memo[b]
# endpoints: inputs of seq cells and module outputs
ends=[]
for cn,c in cells.items():
    if seqtypes(c['type']):
        for p,bits in c['connections'].items():
            if c['port_directions'][p]=='input':
                ends+= [x for x in bits if isinstance(x,int)]
for pn,p in m['ports'].items():
    if p['direction']=='output': ends+=[x for x in p['bits'] if isinstance(x,int)]
e=max(ends,key=lambda b: depth(b)[0])
print('depth',depth(e)[0])
b=e; path=[]
while b is not None:
    nm=[n for n in names[b] if not n.startswith('$')]
    path.append((depth(b)[0], nm[:2] if nm else '-'))
    b=depth(b)[1]
for x in path:
    if x[1]!='-': print(x)
print('--- top endpoints')
seen={}
for b in ends:
    nm=[n for n in names[b] if not n.startswith('$')]
    k=nm[0] if nm else str(b)
    seen[k]=max(seen.get(k,0),depth(b)[0])
for k,v in sorted(seen.items(),key=lambda x:-x[1])[:12]: print(v,k)
