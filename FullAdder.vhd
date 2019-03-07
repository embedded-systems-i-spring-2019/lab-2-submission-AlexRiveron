----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 07:34:14 PM
-- Design Name: 
-- Module Name: FullAdder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Y : out STD_LOGIC;
           Cout : out STD_LOGIC);
end Adder;

architecture Adder of Adder is

signal temp1, temp2, temp3 : STD_LOGIC;

begin
    process (A,B,Cin)
    begin
        Y <= (A xor B) xor Cin;
        --temp1 <= A xor B;
        --temp2 <= temp1 and Cin;
        --temp3 <= A and B;
        Cout <= (((A xor B) and Cin) or (A and B)); 
        --Cout <= temp2 or temp3;     
end process;
end Adder;
