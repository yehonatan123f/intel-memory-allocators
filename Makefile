CC = icpx
CFLAGS = -fiopenmp -fopenmp-targets=spir64
SOURCES = $(wildcard *.cpp)
OBJECTS = $(SOURCES:.cpp=)
TARGETS = $(OBJECTS)

all: $(TARGETS)

%: %.cpp
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(TARGETS)

.PHONY: all clean
