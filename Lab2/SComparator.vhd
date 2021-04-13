----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:43 11/17/2020 
-- Design Name: 
-- Module Name:    SComparator - Behavioral 
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

entity SComparator is
    Port ( C0 : in  STD_LOGIC;
           C1 : in  STD_LOGIC;
           C2 : in  STD_LOGIC;
           C3 : in  STD_LOGIC;
           D0 : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           D3 : in  STD_LOGIC;
           E : out  STD_LOGIC;
           G_CD : out  STD_LOGIC;
           G_DC : out  STD_LOGIC);
end SComparator;

architecture Behavioral of SComparator is

begin
	E <= (C3 XNOR D3) AND (C2 XNOR D2) AND (C1 XNOR D1) AND (C0 XNOR D0);
	

						
	G_CD <= ((D3 XNOR C3) AND (D2 XNOR C2) AND (D1 XNOR C1) AND (D0 XNOR C0)) NOR 
					((C3 AND (NOT D3)) OR (D2 AND (NOT C2) AND (D3 XNOR C3)) OR (D1 AND (NOT C1) 
						AND (D3 XNOR C3) AND (D2 XNOR C2)) OR (D0 AND (NOT C0) AND (D3 XNOR C3) 
							AND (D2 XNOR C2) AND (D1 XNOR C1)));
							
	G_DC <= (C3 AND (NOT D3)) OR (D2 AND (NOT C2) AND (D3 XNOR C3)) OR (D1 AND (NOT C1) 
					AND (D3 XNOR C3) AND (D2 XNOR C2)) OR (D0 AND (NOT C0) AND (D3 XNOR C3) 
						AND (D2 XNOR C2) AND (D1 XNOR C1));


end Behavioral;

