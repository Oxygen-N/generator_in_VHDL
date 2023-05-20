library ieee;
use ieee.std_logic_1164.all;

entity register_test is
end register_test;

architecture test_register_arch of register_test is 

   signal d: std_logic_vector(1 to 24);
   signal q: std_logic_vector(1 to 24);
   signal clk, reset : std_logic;

   begin
      dut: entity work.reg(behavioral)
      port map(d => d, q => q, clk => clk, reset => reset);
      
      stimulus: process is
      begin
	reset <= '1';
	d <= "000000000000000000000000";
	clk <= '1';
	wait for 25 ns;
	clk <= '0';
	wait for 25 ns;
        d <= "001000100010001000100010";
	clk <= '1';
	wait for 25 ns;
	clk <= '0';
	wait for 25 ns;
        d <= "010001000100010001000100";
	clk <= '1';
	wait for 25 ns;
	clk <= '0';
	wait for 25 ns;
        d <= "011001100110011001100110";
	clk <= '1';
	wait for 25 ns;
	clk <= '0';
	wait for 25 ns;
        d <= "100010001000100010001000";
	clk <= '1';
	wait for 25 ns;
	clk <= '0';
	wait for 25 ns;
        d <= "101010101010101010101010";
	clk <= '1';
	wait for 25 ns;
	clk <= '0';
	wait for 25 ns;
        d <= "110011001100110011001100"; 
	clk <= '1';
	wait for 25 ns;
	clk <= '0';
	wait for 25 ns;
        d <= "101110111011101110111011";
	clk <= '1';
	wait for 25 ns;
	clk <= '0';
	wait;
   end process stimulus;
end test_register_arch;

