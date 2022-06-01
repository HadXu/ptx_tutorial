sample: t2.ptx
	clang++ main.cpp -o sample -O2 -g -I/usr/local/cuda-11.7/include -lcuda

t2.ptx: t2.opt.bc
	llc -mcpu=sm_20 t2.opt.bc -o t2.ptx

t2.opt.bc: t2.linked.bc
	opt -internalize -internalize-public-api-list=kernel -nvvm-reflect -O3 t2.linked.bc -o t2.opt.bc

t2.linked.bc: 
	llvm-link t2.bc /usr/local/cuda-11.7/nvvm/libdevice/libdevice.10.bc -o t2.linked.bc

.PHONY: clean
clean:
	rm sample t2.linked.bc t2.opt.bc t2.ptx
