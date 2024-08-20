# Default to a specific source file if not specified
SOURCE ?= test.s
BUILD_DIR = build

# Define object and target based on the source file
OBJECT = $(BUILD_DIR)/$(SOURCE:.s=.o)
TARGET = $(BUILD_DIR)/$(SOURCE:.s=)

# Phony targets to always execute
.PHONY: all run $(TARGET)

# Default target (build the specified source file)
run: $(TARGET)
	@echo ""
	qemu-mips $(TARGET)

# Target to build and run the executable
$(TARGET): $(SOURCE)
	mips-linux-gnu-as $(SOURCE) -o $(OBJECT)
	mips-linux-gnu-ld $(OBJECT) -static -nostdlib -o $(TARGET)

