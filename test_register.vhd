library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_test is
end register_test;

architecture test_register_arch of register_test is 
    signal d: std_logic_vector(1 to 24);
    signal q: std_logic_vector(1 to 24);
    signal clk, reset : std_logic;
    -- Clock period definitions
    constant Tpc : time := 50ns;
begin
    dut: entity work.register_24_bit(behavioral)
        port map(d => d, q => q, clk => clk, reset => reset);
    
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
        reset <= '0'; wait;
        d <= x"000000";
        wait for Tpc/2;
        --Start testing
        for i in 0 to 100 loop
            d <= std_logic_vector(unsigned(d) + 1);
            wait for Tpc; 
        end loop;
    end process stimulus;
end test_register_arch;
