----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:30:42 11/17/2020 
-- Design Name: 
-- Module Name:    MComparator - Behavioral 
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

entity MComparator is
    Port ( A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           A3 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           B2 : in  STD_LOGIC;
           B3 : in  STD_LOGIC;
           E : out  STD_LOGIC;
           G_AB : out  STD_LOGIC;
           G_BA : out  STD_LOGIC);
end MComparator;

architecture Behavioral of MComparator is

begin

	E <= (A3 XNOR B3) AND (A2 XNOR B2) AND (A1 XNOR B1) AND (A0 XNOR B0);
	
	G_AB <= (A3 AND (NOT B3)) OR
					((A3 XNOR B3) AND A2 AND (NOT B2)) OR
						((A3 XNOR B3) AND (A2 XNOR B2) AND A1 AND (NOT B1)) OR
							((A3 XNOR B3) AND (A2 XNOR B2) AND (A1 XNOR B1) AND A0 AND (NOT B0));

	G_BA <= ((NOT A3) AND B3) OR
					((A3 XNOR B3) AND (NOT A2) AND B2) OR
						((A3 XNOR B3) AND (A2 XNOR B2) AND (NOT A1) AND B1) OR
							((A3 XNOR B3) AND (A2 XNOR B2) AND (A1 XNOR B1) AND (NOT A0) AND B0);
end Behavioral;

