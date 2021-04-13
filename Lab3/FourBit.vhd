----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:50:14 12/27/2020 
-- Design Name: 
-- Module Name:    FourBit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FourBit is
    Port ( M : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C0 : in  STD_LOGIC;
           Fout : out  STD_LOGIC_VECTOR (3 downto 0);
           Over_flow : out  STD_LOGIC);
end FourBit;

architecture Behavioral of FourBit is

	Component BitSlice
		    Port ( Mode : in  STD_LOGIC;
           Selector : in  STD_LOGIC_VECTOR (1 downto 0);
           A_i : in  STD_LOGIC;
           B_i : in  STD_LOGIC;
           Carry_in : in  STD_LOGIC;
           F : out  STD_LOGIC;
           Carry_out : out  STD_LOGIC);
	end Component;
	
	signal C : STD_LOGIC_VECTOR (4 downto 1);
	signal F : STD_LOGIC_VECTOR (3 downto 0);
	
	
begin

	ALU0 : BitSlice port map (M, S, A(0), B(0), C0, F(0), C(1));
	ALU1 : BitSlice port map (M, S, A(1), B(1), C(1), F(1), C(2));
	ALU2 : BitSlice port map (M, S, A(2), B(2), C(2), F(2), C(3));
	ALU3 : BitSlice port map (M, S, A(3), B(3), C(3), F(3), C(4));
	
	with M select
		Over_flow <= C(3) XOR C(4) when '1', '0' when others;
		Fout <= F;
		

end Behavioral;

