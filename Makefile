TARGET = boots
OBJS = boots.o bootsector.o read.o show.o \
	mbr.o pbrfat.o tempfile.o
CXXFLAGS += -std=c++11
LDFLAGS += -lboost_program_options -lboost_system -lboost_regex -lboost_filesystem -lPocoFoundation -lPocoUtil

.PHONY: all
all:
	make $(TARGET)

$(TARGET): $(OBJS) Makefile
	$(CXX) -o $(TARGET) $(OBJS) $(LDFLAGS)

.PHONY: clean
clean:
	rm *.o
