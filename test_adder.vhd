library ieee;
use ieee.std_logic_1164.all;

entity adder_test is
end adder_test;

architecture test_adder_arch of adder_test is 

   signal a, b: std_logic_vector(1 to 24);
   signal c: std_logic_vector(1 to 24);

   begin
      dut: entity work.sum(behavioral)
      port map(a => a, b => b, c => c);
      
      stimulus: process is
      begin
	a <= "000000000000000000000000";
	b <= "000100010001000100010001";
	wait for 50 ns;
        a <= "001000100010001000100010";
        b <= "001100110011001100110011"; 
	wait for 50 ns;
        a <= "010001000100010001000100";
        b <= "010101010101010101010101";
	wait for 50 ns;
        a <= "011001100110011001100110";
        b <= "011101110111011101110111"; 
	wait for 50 ns;
        a <= "100010001000100010001000";
        b <= "100110011001100110011001"; 
	wait for 50 ns;
        a <= "101010101010101010101010";
        b <= "101110111011101110111011"; 
	wait for 50 ns;
        a <= "110011001100110011001100"; 
        b <= "001100110011001100110011";
	wait for 50 ns;
        a <= "101110111011101110111011";
        b <= "010101010101010101010101"; 
	wait;
   end process stimulus;
end test_adder_arch;

