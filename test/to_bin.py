import sys

def main():
    if len(sys.argv) != 3:
        print(f"Usage: python {sys.argv[0]} input.hex output.bin")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    with open(input_file, 'r') as fin, open(output_file, 'wb') as fout:
        for line in fin:
            hex_str = line.strip()
            if hex_str:
                fout.write(bytes([int(hex_str, 16)]))

if __name__ == '__main__':
    main()
