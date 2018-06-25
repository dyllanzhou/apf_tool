TARGETS += apf_disassembler
TARGETS += apf_run

all: $(TARGETS)

CFLAGS += -D_GNU_SOURCE -Wall -Wextra  -g 
LFLAGS += 

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

RUN_SRC += apf_run.o 
RUN_SRC += apf_interpreter.o

DISASSEMBLER_SRC += apf_disassembler.o


apf_run: $(RUN_SRC)
	$(CC) $(RUN_SRC) $(LFLAGS) -o $@

apf_disassembler: $(DISASSEMBLER_SRC)
	$(CC) $(DISASSEMBLER_SRC) $(LFLAGS) -o $@

indent:
	indent *.c *.h

clean:
	rm -f *.[oais] *~ $(TARGETS)
