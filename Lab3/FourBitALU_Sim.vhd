--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:11:07 12/27/2020
-- Design Name:   
-- Module Name:   C:/Users/akalayci18/Xilinx/LAB3/FourBitALU_Sim.vhd
-- Project Name:  LAB3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourBit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FourBitALU_Sim IS
END FourBitALU_Sim;
 
ARCHITECTURE behavior OF FourBitALU_Sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBit
    PORT(
         M : IN  std_logic;
         S : IN  std_logic_vector(1 downto 0);
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         C0 : IN  std_logic;
         Fout : OUT  std_logic_vector(3 downto 0);
         Over_flow : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal M : std_logic := '0';
   signal S : std_logic_vector(1 downto 0) := (others => '0');
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal C0 : std_logic := '0';

 	--Outputs
   signal Fout : std_logic_vector(3 downto 0);
   signal Over_flow : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBit PORT MAP (
          M => M,
          S => S,
          A => A,
          B => B,
          C0 => C0,
          Fout => Fout,
          Over_flow => Over_flow
        );

 

   -- Stimulus process
   stim_proc: process
   begin	
			M <= '0' ; A <= "1001"; B <= "0110"; S<= "00";
		wait for Clock_period;
			M <= '0' ; A <= "1001"; B <= "0110"; S<= "01";
		wait for Clock_period;
			M <= '0' ; A <= "1001"; B <= "0110"; S<= "10";
		wait for Clock_period;
			M <= '0' ; A <= "1001"; B <= "0110"; S<= "11"; 
		wait for Clock_period;	
			M <= '1' ; A <= "1001"; B <= "0110"; S<= "00"; C0<= '0';
		wait for Clock_period;	
			M <= '1' ; A <= "1001"; B <= "0110"; S<= "00"; C0<= '1';
		wait for Clock_period;	
			M <= '1' ; A <= "1001"; B <= "0110"; S<= "01"; C0<= '0';
		wait for Clock_period;	
			M <= '1' ; A <= "1001"; B <= "0110"; S<= "01"; C0<= '1';
		wait for Clock_period;	
			M <= '1' ; A <= "1001"; B <= "0110"; S<= "10"; C0<= '0';
		wait for Clock_period;	
			M <= '1' ; A <= "1001"; B <= "0110"; S<= "10"; C0<= '1';
		wait for Clock_period;	
			M <= '1' ; A <= "1001"; B <= "0110"; S<= "11"; C0<= '0';
		wait for Clock_period;	
			M <= '1' ; A <= "1001"; B <= "0110"; S<= "11"; C0<= '1';
		wait for Clock_period;	
			M <= '0' ; A <= "0000"; B <= "0000"; S<= "00"; C0<= '0';
				
      wait;
   end process;

END;
