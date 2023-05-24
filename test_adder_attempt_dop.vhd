library ieee;
use ieee.std_logic_1164.all;

entity adder_attempt_dop_test is
end adder_attempt_dop_test;

architecture test_adder_attempt_dop_arch of adder_attempt_dop_test is 

   signal a, b: std_logic_vector(1 to 24);
   signal Sum: std_logic_vector(1 to 24);

   begin
      dut: entity work.adder_24bit(behavioral)
        port map(a => a, b => b, Sum => Sum);

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
end architecture test_adder_attempt_dop_arch;
