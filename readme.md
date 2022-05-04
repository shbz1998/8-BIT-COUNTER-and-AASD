# AASD and 8-bit Counter 
## Shahbaz Hassan Khan Malik

This is a reloadable 8-bit up counter. It also includes an AASD-type reset syncronizer for the reset signal.

1. The reset is asynronoous active low input.
2. The enable is synchronous, active high input. 
3. LOAD is a synchronous, active high input.
4. When LOAD is low, ENABLE is high and RST is high, the 
counter advances on the positive edge of the clock. 

<img width="546" alt="Screen Shot 2022-05-04 at 1 22 20 PM" src="https://user-images.githubusercontent.com/98668171/166819533-734c1762-c44d-44cb-8798-787a40f3e638.png">
<img width="575" alt="Screen Shot 2022-05-04 at 1 22 37 PM" src="https://user-images.githubusercontent.com/98668171/166819571-e38b2e1c-6cfc-4a47-9cc5-9a5abfd35f96.png">
