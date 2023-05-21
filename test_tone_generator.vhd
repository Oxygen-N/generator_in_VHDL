library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_tone is
end test_tone;

architecture test_tone_arch of test_tone is 
    signal clk, reset : std_logic;
    signal tone: std_logic_vector(1 to 24);
    constant Tpc : time := 50ns;
begin
    dut: entity work.tone_generator(behavioral)
        port map(clk => clk, reset => reset, tone => tone);
    
    clock : process is
    begin
        clk <= '0';
        wait for Tpc/2;
        clk <= '1';
        wait for Tpc/2;
    end process clock;
    
    stimulus : process is
    begin
        reset <= '1'; wait for Tpc/2;
        reset <= '0'; wait for Tpc/2;
    end process stimulus;
end test_tone_arch;