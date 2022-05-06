library IEEE;
use IEEE.std_logic_1164.all;

entity FSM_Vertical is
   port(
      RST : in  std_logic;                -- Reset maestro
      CLK : in  std_logic;                -- Reloj maestro
      EC  : in  std_logic_vector(1 to 4); -- Fin de cuenta
      ST  : out std_logic_vector(1 to 4); -- Inicio de cuenta
      EHS : out std_logic;                -- Habilitacion horizontal
      VS  : out std_logic                 -- Sincronia vertical
      );
   end FSM_Vertical;

architecture Cascada of FSM_Vertical is

-- Estados internos
signal Qp, Qn : std_logic_vector(2 downto 0);

begin

   Combinacional: process(EC,Qp)
   begin
      case Qp is
         when "000"  =>
            Qn  <= "001";
            ST  <= "0000";
            EHS <= '0';
            VS  <= '1';
         when "001"  =>
            if (EC(1)='1') then
               Qn <= "010";
            else
               Qn <= Qp;
            end if;
            ST  <= "1000";
            EHS <= '0';
            VS  <= '0';
         when "010"  =>
            if (EC(2)='1') then
               Qn <= "011";
            else
               Qn <= Qp;
            end if;
            ST  <= "0100";
            EHS <= '0';
            VS  <= '1';
         when "011"  =>
            if (EC(3)='1') then
               Qn <= "100";
            else
               Qn <= Qp;
            end if;
            ST  <= "0010";
            EHS <= '1';
            VS  <= '1';
         when "100"  =>
            if (EC(4)='1') then
               Qn <= "001";
            else
               Qn <= Qp;
            end if;
            ST  <= "0001";
            EHS <= '0';
            VS  <= '1';
         when others =>
            Qn  <= "000";
            ST  <= "0000";
            EHS <= '0';
            VS  <= '1';
      end case;
   end process Combinacional;

   Secuencial: process(RST,CLK)
   begin
      if (RST='0') then
         Qp <= (others => '0');
      elsif (CLK'event and CLK='1') then 
         Qp <= Qn;
      end if;
   end process Secuencial;

end Cascada;
