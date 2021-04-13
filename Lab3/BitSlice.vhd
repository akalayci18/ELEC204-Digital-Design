----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:15:51 12/27/2020 
-- Design Name: 
-- Module Name:    BitSlice - Behavioral 
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

entity BitSlice is
    Port ( Mode : in  STD_LOGIC;
           Selector : in  STD_LOGIC_VECTOR (1 downto 0);
           A_i : in  STD_LOGIC;
           B_i : in  STD_LOGIC;
           Carry_in : in  STD_LOGIC;
           F : out  STD_LOGIC;
           Carry_out : out  STD_LOGIC);
end BitSlice;

architecture Behavioral of BitSlice is

	Component FullAdder
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           CarryIn : in  STD_LOGIC;
           CarryOut : out  STD_LOGIC;
           Sum : out  STD_LOGIC);
	end Component;
	
	signal LU_OUT : STD_LOGIC;
	signal F_OUT  : STD_LOGIC_VECTOR (1 downto 0);
	signal AU_OUT : STD_LOGIC_VECTOR (1 downto 0);
	signal Input  : STD_LOGIC_VECTOR (1 downto 0);

begin

	FA : FullAdder port map (Input(1), Input(0), Carry_in, AU_OUT(1), AU_OUT(0));
		
	with Selector select
		LU_OUT <= (A_i AND B_i) when "00", (A_i OR B_i) when "01", (A_i XOR B_i) when "10", (A_i XNOR B_i) when "11", '0' when others;
	with Selector select	
		Input <= (A_i & '0') when "00", (A_i, B_i) when "01", (A_i, (NOT B_i)) when "10", ((NOT A_i), B_i) when "11", "00" when others;
	with Mode select
		F_OUT <= ('0' & LU_OUT) when '0', AU_OUT when '1', "00" when others; 
	
	F <= F_OUT(0);
	Carry_out <= F_OUT(1);
	
end Behavioral;

