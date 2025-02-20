#!/usr/bin/env python3
import sys
import argparse
import os.path

def split_hex_to_banks(input_file, num_banks, output_prefix):
    try:
        with open(input_file, 'r') as f:
            data = f.readlines()
        
        # Strip whitespace and newlines
        data = [line.strip() for line in data if line.strip()]
        
        # Create output files for each bank
        bank_files = []
        for i in range(num_banks):
            bank_files.append(open(f"{output_prefix}_bank{i}.hex", 'w'))
        
        # Distribute data to banks
        for addr, value in enumerate(data):
            bank_num = addr % num_banks
            bank_files[bank_num].write(f"{value}\n")
        
        # Close all files
        for f in bank_files:
            f.close()
            
    except FileNotFoundError:
        print(f"Error: Input file '{input_file}' not found")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {str(e)}")
        sys.exit(1)

def main():
    parser = argparse.ArgumentParser(description='Split hex file into memory banks')
    parser.add_argument('input_file', help='Input hex file path')
    parser.add_argument('-n', '--num_banks', type=int, default=4,
                        help='Number of memory banks (default: 4)')
    parser.add_argument('-o', '--output_prefix', 
                        help='Output files prefix (optional, defaults to input filename)')
    
    args = parser.parse_args()
    
    # Get the base name of the input file without extension
    if args.output_prefix is None:
        args.output_prefix = os.path.splitext(args.input_file)[0]
    
    split_hex_to_banks(args.input_file, args.num_banks, args.output_prefix)

if __name__ == "__main__":
    main()
