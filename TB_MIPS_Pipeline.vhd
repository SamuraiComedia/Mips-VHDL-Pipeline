-- Libraries definitions
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_MIPS_Pipeline is
end entity;

architecture behaviour of TB_MIPS_Pipeline is

    -- Componente a ser validado
    component MIPS_Pipeline is
        port(
            clock       : in std_logic;
            reset       : in std_logic;
            R0_out      : out std_logic_vector(7 downto 0);
            R1_out      : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Sinais para o testbench
    signal reset_sg       : std_logic := '1';  -- Sinal de reset
    signal clock_sg       : std_logic := '0';  -- Sinal de clock
    signal R0_out_sg      : std_logic_vector(7 downto 0);
    signal R1_out_sg      : std_logic_vector(7 downto 0);

begin
    -- Instanciação do componente processador_MIPS_Pipeline
    inst_MIPS_Pipeline : MIPS_Pipeline
        port map (
            clock     => clock_sg,
            reset     => reset_sg,
            R0_out    => R0_out_sg,
            R1_out    => R1_out_sg
        );

    -- Geração do clock
    clock_sg <= not clock_sg after 3 ns;

    -- Processo para simulação
    process
    begin
        -- Inicializa reset
        wait for 2 ns;
        reset_sg <= '0';  -- Desativa o reset

        -- Teste 1: Carrega instruções e verifica saídas
        wait for 7 ns;
        -- Nesse instante, verificações podem ser realizadas nos valores de R0_out e R1_out
        -- Para observar os valores esperados conforme a lógica da ULA e as operações carregadas na memória de instruções.

        -- Teste 2: Altera o estado das memórias de entrada e verifica comportamento do pipeline
        wait for 9 ns;

        -- Teste 3: Teste adicional para operações aritméticas
        wait for 9 ns;

        -- Fim do teste
        wait;
    end process;

end behaviour;
