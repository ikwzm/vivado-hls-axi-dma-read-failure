library ieee;
use     ieee.std_logic_1164.all;
library DUMMY_PLUG;
use     DUMMY_PLUG.AXI4_TYPES.all;
entity  TEST_BENCH is
    generic (
        NAME            : STRING := "test";
        SCENARIO_FILE   : STRING := "test_1.snr"
    );
end     TEST_BENCH;

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;
use     std.textio.all;
library DUMMY_PLUG;
use     DUMMY_PLUG.AXI4_TYPES.all;
use     DUMMY_PLUG.AXI4_MODELS.AXI4_MASTER_PLAYER;
use     DUMMY_PLUG.AXI4_MODELS.AXI4_SLAVE_PLAYER;
use     DUMMY_PLUG.AXI4_MODELS.AXI4_SIGNAL_PRINTER;
use     DUMMY_PLUG.AXI4_MODELS.AXI4_STREAM_SLAVE_PLAYER;
use     DUMMY_PLUG.SYNC.all;
use     DUMMY_PLUG.CORE.MARCHAL;
use     DUMMY_PLUG.CORE.REPORT_STATUS_TYPE;
use     DUMMY_PLUG.CORE.REPORT_STATUS_VECTOR;
use     DUMMY_PLUG.CORE.MARGE_REPORT_STATUS;
architecture MODEL of TEST_BENCH is
    -------------------------------------------------------------------------------
    -- 
    -------------------------------------------------------------------------------
    constant  PERIOD            : time    := 10 ns;
    constant  DELAY             : time    :=  1 ns;
    constant  SYNC_WIDTH        : integer :=  2;
    constant  GPO_WIDTH         : integer :=  8;
    constant  GPI_WIDTH         : integer :=  GPO_WIDTH;
    -------------------------------------------------------------------------------
    -- 
    -------------------------------------------------------------------------------
    component design_1_wrapper
        port (
            ap_clk              : in  std_logic;
            ap_rst_n            : in  std_logic;
            M00_AXI_araddr      : out std_logic_vector(31 downto 0);
            M00_AXI_arburst     : out std_logic_vector( 1 downto 0);
            M00_AXI_arcache     : out std_logic_vector( 3 downto 0);
            M00_AXI_arlen       : out std_logic_vector( 7 downto 0);
            M00_AXI_arlock      : out std_logic_vector( 1 downto 0);
            M00_AXI_arprot      : out std_logic_vector( 2 downto 0);
            M00_AXI_arqos       : out std_logic_vector( 3 downto 0);
            M00_AXI_arready     : in  std_logic;
            M00_AXI_arregion    : out std_logic_vector( 3 downto 0);
            M00_AXI_arsize      : out std_logic_vector( 2 downto 0);
            M00_AXI_arvalid     : out std_logic;
            M00_AXI_awaddr      : out std_logic_vector(31 downto 0);
            M00_AXI_awburst     : out std_logic_vector( 1 downto 0);
            M00_AXI_awcache     : out std_logic_vector( 3 downto 0);
            M00_AXI_awlen       : out std_logic_vector( 7 downto 0);
            M00_AXI_awlock      : out std_logic_vector( 1 downto 0);
            M00_AXI_awprot      : out std_logic_vector( 2 downto 0);
            M00_AXI_awqos       : out std_logic_vector( 3 downto 0);
            M00_AXI_awready     : in  std_logic;
            M00_AXI_awregion    : out std_logic_vector( 3 downto 0);
            M00_AXI_awsize      : out std_logic_vector( 2 downto 0);
            M00_AXI_awvalid     : out std_logic;
            M00_AXI_bready      : out std_logic;
            M00_AXI_bresp       : in  std_logic_vector( 1 downto 0);
            M00_AXI_bvalid      : in  std_logic;
            M00_AXI_rdata       : in  std_logic_vector(31 downto 0);
            M00_AXI_rlast       : in  std_logic;
            M00_AXI_rready      : out std_logic;
            M00_AXI_rresp       : in  std_logic_vector( 1 downto 0);
            M00_AXI_rvalid      : in  std_logic;
            M00_AXI_wdata       : out std_logic_vector(31 downto 0);
            M00_AXI_wlast       : out std_logic;
            M00_AXI_wready      : in  std_logic;
            M00_AXI_wstrb       : out std_logic_vector( 3 downto 0);
            M00_AXI_wvalid      : out std_logic;
            S00_AXI_araddr      : in  std_logic_vector( 5 downto 0);
            S00_AXI_arready     : out std_logic;
            S00_AXI_arvalid     : in  std_logic;
            S00_AXI_awaddr      : in  std_logic_vector( 5 downto 0);
            S00_AXI_awready     : out std_logic;
            S00_AXI_awvalid     : in  std_logic;
            S00_AXI_bready      : in  std_logic;
            S00_AXI_bresp       : out std_logic_vector( 1 downto 0);
            S00_AXI_bvalid      : out std_logic;
            S00_AXI_rdata       : out std_logic_vector(31 downto 0);
            S00_AXI_rready      : in  std_logic;
            S00_AXI_rresp       : out std_logic_vector( 1 downto 0);
            S00_AXI_rvalid      : out std_logic;
            S00_AXI_wdata       : in  std_logic_vector(31 downto 0);
            S00_AXI_wready      : out std_logic;
            S00_AXI_wstrb       : in  std_logic_vector( 3 downto 0);
            S00_AXI_wvalid      : in  std_logic;
            active_frame_V      : in  std_logic_vector( 1 downto 0);
            interrupt           : out std_logic;
            outs_tdata          : out std_logic_vector(31 downto 0);
            outs_tdest          : out std_logic_vector( 0 downto 0);
            outs_tid            : out std_logic_vector( 0 downto 0);
            outs_tkeep          : out std_logic_vector( 3 downto 0);
            outs_tlast          : out std_logic_vector( 0 downto 0);
            outs_tready         : in  std_logic;
            outs_tstrb          : out std_logic_vector( 3 downto 0);
            outs_tuser          : out std_logic_vector( 0 downto 0);
            outs_tvalid         : out std_logic
        );
    end component;
    -------------------------------------------------------------------------------
    --
    -------------------------------------------------------------------------------
    signal    ap_clk            : std_logic;
    signal    ap_rst_n          : std_logic;
    signal    RESET             : std_logic;
    constant  CLEAR             : std_logic := '0';
    -------------------------------------------------------------------------------
    --
    -------------------------------------------------------------------------------
    constant  M00_WIDTH         : AXI4_SIGNAL_WIDTH_TYPE := (
                                    ID          => 4,
                                    AWADDR      => 32,
                                    ARADDR      => 32,
                                    ALEN        => 8,
                                    ALOCK       => 2,
                                    WDATA       => 32,
                                    RDATA       => 32,
                                    ARUSER      => 1,
                                    AWUSER      => 1,
                                    WUSER       => 1,
                                    RUSER       => 1,
                                    BUSER       => 1);
    signal    M00_AXI_arid      : std_logic_vector(M00_WIDTH.ID     -1 downto 0);
    signal    M00_AXI_aruser    : std_logic_vector(M00_WIDTH.ARUSER -1 downto 0);
    signal    M00_AXI_araddr    : std_logic_vector(M00_WIDTH.ARADDR -1 downto 0);
    signal    M00_AXI_arburst   : std_logic_vector( 1 downto 0);
    signal    M00_AXI_arcache   : std_logic_vector( 3 downto 0);
    signal    M00_AXI_arlen     : std_logic_vector(M00_WIDTH.ALEN   -1 downto 0);
    signal    M00_AXI_arlock    : std_logic_vector(M00_WIDTH.ALOCK  -1 downto 0);
    signal    M00_AXI_arprot    : std_logic_vector( 2 downto 0);
    signal    M00_AXI_arqos     : std_logic_vector( 3 downto 0);
    signal    M00_AXI_arready   : std_logic;
    signal    M00_AXI_arregion  : std_logic_vector( 3 downto 0);
    signal    M00_AXI_arsize    : std_logic_vector( 2 downto 0);
    signal    M00_AXI_arvalid   : std_logic;
    signal    M00_AXI_rdata     : std_logic_vector(M00_WIDTH.RDATA  -1 downto 0);
    signal    M00_AXI_rlast     : std_logic;
    signal    M00_AXI_rready    : std_logic;
    signal    M00_AXI_rresp     : std_logic_vector( 1 downto 0);
    signal    M00_AXI_rvalid    : std_logic;
    signal    M00_AXI_rid       : std_logic_vector(M00_WIDTH.ID     -1 downto 0);
    signal    M00_AXI_ruser     : std_logic_vector(M00_WIDTH.RUSER  -1 downto 0);
    signal    M00_AXI_awaddr    : std_logic_vector(M00_WIDTH.AWADDR -1 downto 0);
    signal    M00_AXI_awburst   : std_logic_vector( 1 downto 0);
    signal    M00_AXI_awcache   : std_logic_vector( 3 downto 0);
    signal    M00_AXI_awlen     : std_logic_vector(M00_WIDTH.ALEN   -1 downto 0);
    signal    M00_AXI_awlock    : std_logic_vector(M00_WIDTH.ALOCK  -1 downto 0);
    signal    M00_AXI_awprot    : std_logic_vector( 2 downto 0);
    signal    M00_AXI_awqos     : std_logic_vector( 3 downto 0);
    signal    M00_AXI_awready   : std_logic;
    signal    M00_AXI_awregion  : std_logic_vector( 3 downto 0);
    signal    M00_AXI_awsize    : std_logic_vector( 2 downto 0);
    signal    M00_AXI_awvalid   : std_logic;
    signal    M00_AXI_awid      : std_logic_vector(M00_WIDTH.ID     -1 downto 0);
    signal    M00_AXI_awuser    : std_logic_vector(M00_WIDTH.AWUSER -1 downto 0);
    signal    M00_AXI_wdata     : std_logic_vector(M00_WIDTH.WDATA  -1 downto 0);
    signal    M00_AXI_wlast     : std_logic;
    signal    M00_AXI_wready    : std_logic;
    signal    M00_AXI_wstrb     : std_logic_vector(M00_WIDTH.WDATA/8-1 downto 0);
    signal    M00_AXI_wvalid    : std_logic;
    signal    M00_AXI_wid       : std_logic_vector(M00_WIDTH.ID     -1 downto 0);
    signal    M00_AXI_wuser     : std_logic_vector(M00_WIDTH.WUSER  -1 downto 0);
    signal    M00_AXI_bready    : std_logic;
    signal    M00_AXI_bresp     : std_logic_vector( 1 downto 0);
    signal    M00_AXI_bvalid    : std_logic;
    signal    M00_AXI_bid       : std_logic_vector(M00_WIDTH.ID     -1 downto 0);
    signal    M00_AXI_buser     : std_logic_vector(M00_WIDTH.BUSER  -1 downto 0);
    -------------------------------------------------------------------------------
    --
    -------------------------------------------------------------------------------
    constant  S00_WIDTH         : AXI4_SIGNAL_WIDTH_TYPE := (
                                    ID          => 4,
                                    AWADDR      => 6,
                                    ARADDR      => 6,
                                    ALEN        => 8,
                                    ALOCK       => 2,
                                    WDATA       => 32,
                                    RDATA       => 32,
                                    ARUSER      => 1,
                                    AWUSER      => 1,
                                    WUSER       => 1,
                                    RUSER       => 1,
                                    BUSER       => 1);
    signal    S00_AXI_arid      : std_logic_vector(S00_WIDTH.ID     -1 downto 0);
    signal    S00_AXI_aruser    : std_logic_vector(S00_WIDTH.ARUSER -1 downto 0);
    signal    S00_AXI_araddr    : std_logic_vector(S00_WIDTH.ARADDR -1 downto 0);
    signal    S00_AXI_arburst   : std_logic_vector( 1 downto 0);
    signal    S00_AXI_arcache   : std_logic_vector( 3 downto 0);
    signal    S00_AXI_arlen     : std_logic_vector(S00_WIDTH.ALEN   -1 downto 0);
    signal    S00_AXI_arlock    : std_logic_vector(S00_WIDTH.ALOCK  -1 downto 0);
    signal    S00_AXI_arprot    : std_logic_vector( 2 downto 0);
    signal    S00_AXI_arqos     : std_logic_vector( 3 downto 0);
    signal    S00_AXI_arready   : std_logic;
    signal    S00_AXI_arregion  : std_logic_vector( 3 downto 0);
    signal    S00_AXI_arsize    : std_logic_vector( 2 downto 0);
    signal    S00_AXI_arvalid   : std_logic;
    signal    S00_AXI_rdata     : std_logic_vector(S00_WIDTH.RDATA  -1 downto 0);
    constant  S00_AXI_rlast     : std_logic := '1';
    signal    S00_AXI_rready    : std_logic;
    signal    S00_AXI_rresp     : std_logic_vector( 1 downto 0);
    signal    S00_AXI_rvalid    : std_logic;
    constant  S00_AXI_rid       : std_logic_vector(S00_WIDTH.ID     -1 downto 0) := (others => '0');
    constant  S00_AXI_ruser     : std_logic_vector(S00_WIDTH.RUSER  -1 downto 0) := (others => '0');
    signal    S00_AXI_awaddr    : std_logic_vector(S00_WIDTH.AWADDR -1 downto 0);
    signal    S00_AXI_awburst   : std_logic_vector( 1 downto 0);
    signal    S00_AXI_awcache   : std_logic_vector( 3 downto 0);
    signal    S00_AXI_awlen     : std_logic_vector(S00_WIDTH.ALEN   -1 downto 0);
    signal    S00_AXI_awlock    : std_logic_vector(S00_WIDTH.ALOCK  -1 downto 0);
    signal    S00_AXI_awprot    : std_logic_vector( 2 downto 0);
    signal    S00_AXI_awqos     : std_logic_vector( 3 downto 0);
    signal    S00_AXI_awready   : std_logic;
    signal    S00_AXI_awregion  : std_logic_vector( 3 downto 0);
    signal    S00_AXI_awsize    : std_logic_vector( 2 downto 0);
    signal    S00_AXI_awvalid   : std_logic;
    signal    S00_AXI_awid      : std_logic_vector(S00_WIDTH.ID     -1 downto 0);
    signal    S00_AXI_awuser    : std_logic_vector(S00_WIDTH.AWUSER -1 downto 0);
    signal    S00_AXI_wdata     : std_logic_vector(S00_WIDTH.WDATA  -1 downto 0);
    signal    S00_AXI_wlast     : std_logic;
    signal    S00_AXI_wready    : std_logic;
    signal    S00_AXI_wstrb     : std_logic_vector(S00_WIDTH.WDATA/8-1 downto 0);
    signal    S00_AXI_wvalid    : std_logic;
    signal    S00_AXI_wid       : std_logic_vector(S00_WIDTH.ID     -1 downto 0);
    signal    S00_AXI_wuser     : std_logic_vector(S00_WIDTH.WUSER  -1 downto 0);
    signal    S00_AXI_bready    : std_logic;
    signal    S00_AXI_bresp     : std_logic_vector( 1 downto 0);
    signal    S00_AXI_bvalid    : std_logic;
    constant  S00_AXI_bid       : std_logic_vector(S00_WIDTH.ID     -1 downto 0) := (others => '0');
    constant  S00_AXI_buser     : std_logic_vector(S00_WIDTH.BUSER  -1 downto 0) := (others => '0');
    -------------------------------------------------------------------------------
    --
    -------------------------------------------------------------------------------
    signal    active_frame_V    : std_logic_vector( 1 downto 0);
    signal    interrupt         : std_logic;
    -------------------------------------------------------------------------------
    --
    -------------------------------------------------------------------------------
    constant  OUT_WIDTH         : AXI4_STREAM_SIGNAL_WIDTH_TYPE := (
                                    ID    => 1,
                                    USER  => 1,
                                    DEST  => 1,
                                    DATA  => 32);
    signal    outs_tdata        : std_logic_vector(OUT_WIDTH.DATA  -1 downto 0);
    signal    outs_tdest        : std_logic_vector(OUT_WIDTH.DEST  -1 downto 0);
    signal    outs_tid          : std_logic_vector(OUT_WIDTH.ID    -1 downto 0);
    signal    outs_tkeep        : std_logic_vector(OUT_WIDTH.DATA/8-1 downto 0);
    signal    outs_tlast        : std_logic_vector( 0 downto 0);
    signal    outs_tready       : std_logic;
    signal    outs_tstrb        : std_logic_vector(OUT_WIDTH.DATA/8-1 downto 0);
    signal    outs_tuser        : std_logic_vector(OUT_WIDTH.USER  -1 downto 0);
    signal    outs_tvalid       : std_logic;
    -------------------------------------------------------------------------------
    -- 
    -------------------------------------------------------------------------------
    signal    SYNC              : SYNC_SIG_VECTOR (SYNC_WIDTH   -1 downto 0);
    -------------------------------------------------------------------------------
    -- 
    -------------------------------------------------------------------------------
    signal    S00_GPI           : std_logic_vector(GPI_WIDTH    -1 downto 0);
    signal    S00_GPO           : std_logic_vector(GPO_WIDTH    -1 downto 0);
    signal    M00_GPI           : std_logic_vector(GPI_WIDTH    -1 downto 0);
    signal    M00_GPO           : std_logic_vector(GPO_WIDTH    -1 downto 0);
    signal    OUT_GPI           : std_logic_vector(GPI_WIDTH    -1 downto 0);
    signal    OUT_GPO           : std_logic_vector(GPO_WIDTH    -1 downto 0);
    -------------------------------------------------------------------------------
    -- 各種状態出力.
    -------------------------------------------------------------------------------
    signal    N_REPORT          : REPORT_STATUS_TYPE;
    signal    S00_REPORT        : REPORT_STATUS_TYPE;
    signal    M00_REPORT        : REPORT_STATUS_TYPE;
    signal    OUT_REPORT        : REPORT_STATUS_TYPE;
    signal    N_FINISH          : std_logic;
    signal    S00_FINISH        : std_logic;
    signal    M00_FINISH        : std_logic;
    signal    OUT_FINISH        : std_logic;
begin
    -------------------------------------------------------------------------------
    --
    -------------------------------------------------------------------------------
    DUT: design_1_wrapper
        port map (
            ap_clk              => ap_clk              , 
            ap_rst_n            => ap_rst_n            , 
            M00_AXI_araddr      => M00_AXI_araddr      , 
            M00_AXI_arburst     => M00_AXI_arburst     , 
            M00_AXI_arcache     => M00_AXI_arcache     , 
            M00_AXI_arlen       => M00_AXI_arlen       , 
            M00_AXI_arlock      => M00_AXI_arlock      , 
            M00_AXI_arprot      => M00_AXI_arprot      , 
            M00_AXI_arqos       => M00_AXI_arqos       , 
            M00_AXI_arready     => M00_AXI_arready     , 
            M00_AXI_arregion    => M00_AXI_arregion    , 
            M00_AXI_arsize      => M00_AXI_arsize      , 
            M00_AXI_arvalid     => M00_AXI_arvalid     , 
            M00_AXI_awaddr      => M00_AXI_awaddr      , 
            M00_AXI_awburst     => M00_AXI_awburst     , 
            M00_AXI_awcache     => M00_AXI_awcache     , 
            M00_AXI_awlen       => M00_AXI_awlen       , 
            M00_AXI_awlock      => M00_AXI_awlock      , 
            M00_AXI_awprot      => M00_AXI_awprot      , 
            M00_AXI_awqos       => M00_AXI_awqos       , 
            M00_AXI_awready     => M00_AXI_awready     , 
            M00_AXI_awregion    => M00_AXI_awregion    , 
            M00_AXI_awsize      => M00_AXI_awsize      , 
            M00_AXI_awvalid     => M00_AXI_awvalid     , 
            M00_AXI_bready      => M00_AXI_bready      , 
            M00_AXI_bresp       => M00_AXI_bresp       , 
            M00_AXI_bvalid      => M00_AXI_bvalid      , 
            M00_AXI_rdata       => M00_AXI_rdata       , 
            M00_AXI_rlast       => M00_AXI_rlast       , 
            M00_AXI_rready      => M00_AXI_rready      , 
            M00_AXI_rresp       => M00_AXI_rresp       , 
            M00_AXI_rvalid      => M00_AXI_rvalid      , 
            M00_AXI_wdata       => M00_AXI_wdata       , 
            M00_AXI_wlast       => M00_AXI_wlast       , 
            M00_AXI_wready      => M00_AXI_wready      , 
            M00_AXI_wstrb       => M00_AXI_wstrb       , 
            M00_AXI_wvalid      => M00_AXI_wvalid      , 
            S00_AXI_araddr      => S00_AXI_araddr      , 
            S00_AXI_arready     => S00_AXI_arready     , 
            S00_AXI_arvalid     => S00_AXI_arvalid     , 
            S00_AXI_awaddr      => S00_AXI_awaddr      , 
            S00_AXI_awready     => S00_AXI_awready     , 
            S00_AXI_awvalid     => S00_AXI_awvalid     , 
            S00_AXI_bready      => S00_AXI_bready      , 
            S00_AXI_bresp       => S00_AXI_bresp       , 
            S00_AXI_bvalid      => S00_AXI_bvalid      , 
            S00_AXI_rdata       => S00_AXI_rdata       , 
            S00_AXI_rready      => S00_AXI_rready      , 
            S00_AXI_rresp       => S00_AXI_rresp       , 
            S00_AXI_rvalid      => S00_AXI_rvalid      , 
            S00_AXI_wdata       => S00_AXI_wdata       , 
            S00_AXI_wready      => S00_AXI_wready      , 
            S00_AXI_wstrb       => S00_AXI_wstrb       , 
            S00_AXI_wvalid      => S00_AXI_wvalid      , 
            active_frame_V      => active_frame_V      , 
            interrupt           => interrupt           , 
            outs_tdata          => outs_tdata          , 
            outs_tdest          => outs_tdest          , 
            outs_tid            => outs_tid            , 
            outs_tkeep          => outs_tkeep          , 
            outs_tlast          => outs_tlast          , 
            outs_tready         => outs_tready         , 
            outs_tstrb          => outs_tstrb          , 
            outs_tuser          => outs_tuser          , 
            outs_tvalid         => outs_tvalid         
        );
    -------------------------------------------------------------------------------
    -- 
    -------------------------------------------------------------------------------
    N: MARCHAL
        generic map(
            SCENARIO_FILE   => SCENARIO_FILE,
            NAME            => "MARCHAL",
            SYNC_PLUG_NUM   => 1,
            SYNC_WIDTH      => SYNC_WIDTH,
            FINISH_ABORT    => FALSE
        )
        port map(
            CLK             => ap_clk          , -- In  :
            RESET           => RESET           , -- Out :
            SYNC(0)         => SYNC(0)         , -- I/O :
            SYNC(1)         => SYNC(1)         , -- I/O :
            REPORT_STATUS   => N_REPORT        , -- Out :
            FINISH          => N_FINISH          -- Out :
        );
    ------------------------------------------------------------------------------
    -- AXI4_MASTER_PLAYER
    ------------------------------------------------------------------------------
    S00: AXI4_MASTER_PLAYER
        generic map (
            SCENARIO_FILE   => SCENARIO_FILE   ,
            NAME            => "S00"           ,
            READ_ENABLE     => TRUE            ,
            WRITE_ENABLE    => TRUE            ,
            OUTPUT_DELAY    => DELAY           ,
            WIDTH           => S00_WIDTH       ,
            SYNC_PLUG_NUM   => 2               ,
            SYNC_WIDTH      => SYNC_WIDTH      ,
            GPI_WIDTH       => GPI_WIDTH       ,
            GPO_WIDTH       => GPO_WIDTH       ,
            FINISH_ABORT    => FALSE
        )
        port map(
        ---------------------------------------------------------------------------
        -- グローバルシグナル.
        ---------------------------------------------------------------------------
            ACLK            => ap_clk          , -- In  :
            ARESETn         => ap_rst_n        , -- In  :
        ---------------------------------------------------------------------------
        -- リードアドレスチャネルシグナル.
        ---------------------------------------------------------------------------
            ARADDR          => S00_AXI_araddr  , -- I/O : 
            ARLEN           => S00_AXI_arlen   , -- I/O : 
            ARSIZE          => S00_AXI_arsize  , -- I/O : 
            ARBURST         => S00_AXI_arburst , -- I/O : 
            ARLOCK          => S00_AXI_arlock  , -- I/O : 
            ARCACHE         => S00_AXI_arcache , -- I/O : 
            ARPROT          => S00_AXI_arprot  , -- I/O : 
            ARQOS           => S00_AXI_arqos   , -- I/O : 
            ARREGION        => S00_AXI_arregion, -- I/O : 
            ARUSER          => S00_AXI_aruser  , -- I/O : 
            ARID            => S00_AXI_arid    , -- I/O : 
            ARVALID         => S00_AXI_arvalid , -- I/O : 
            ARREADY         => S00_AXI_arready , -- In  :    
        ---------------------------------------------------------------------------
        -- リードデータチャネルシグナル.
        ---------------------------------------------------------------------------
            RLAST           => S00_AXI_rlast   , -- In  :    
            RDATA           => S00_AXI_rdata   , -- In  :    
            RRESP           => S00_AXI_rresp   , -- In  :    
            RUSER           => S00_AXI_ruser   , -- In  :    
            RID             => S00_AXI_rid     , -- In  :    
            RVALID          => S00_AXI_rvalid  , -- In  :    
            RREADY          => S00_AXI_rready  , -- I/O : 
        --------------------------------------------------------------------------
        -- ライトアドレスチャネルシグナル.
        --------------------------------------------------------------------------
            AWADDR          => S00_AXI_awaddr  , -- I/O : 
            AWLEN           => S00_AXI_awlen   , -- I/O : 
            AWSIZE          => S00_AXI_awsize  , -- I/O : 
            AWBURST         => S00_AXI_awburst , -- I/O : 
            AWLOCK          => S00_AXI_awlock  , -- I/O : 
            AWCACHE         => S00_AXI_awcache , -- I/O : 
            AWPROT          => S00_AXI_awprot  , -- I/O : 
            AWQOS           => S00_AXI_awqos   , -- I/O : 
            AWREGION        => S00_AXI_awregion, -- I/O : 
            AWUSER          => S00_AXI_awuser  , -- I/O : 
            AWID            => S00_AXI_awid    , -- I/O : 
            AWVALID         => S00_AXI_awvalid , -- I/O : 
            AWREADY         => S00_AXI_awready , -- In  :    
        --------------------------------------------------------------------------
        -- ライトデータチャネルシグナル.
        --------------------------------------------------------------------------
            WLAST           => S00_AXI_wlast   , -- I/O : 
            WDATA           => S00_AXI_wdata   , -- I/O : 
            WSTRB           => S00_AXI_wstrb   , -- I/O : 
            WUSER           => S00_AXI_wuser   , -- I/O : 
            WID             => S00_AXI_wid     , -- I/O : 
            WVALID          => S00_AXI_wvalid  , -- I/O : 
            WREADY          => S00_AXI_wready  , -- In  :    
        --------------------------------------------------------------------------
        -- ライト応答チャネルシグナル.
        --------------------------------------------------------------------------
            BRESP           => S00_AXI_bresp   , -- In  :    
            BUSER           => S00_AXI_buser   , -- In  :    
            BID             => S00_AXI_bid     , -- In  :    
            BVALID          => S00_AXI_bvalid  , -- In  :    
            BREADY          => S00_AXI_bready  , -- I/O : 
        --------------------------------------------------------------------------
        -- シンクロ用信号
        --------------------------------------------------------------------------
            SYNC(0)         => SYNC(0)         , -- I/O :
            SYNC(1)         => SYNC(1)         , -- I/O :
        --------------------------------------------------------------------------
        -- GPIO
        --------------------------------------------------------------------------
            GPI             => S00_GPI         , -- In  :
            GPO             => S00_GPO         , -- Out :
        --------------------------------------------------------------------------
        -- 各種状態出力.
        --------------------------------------------------------------------------
            REPORT_STATUS   => S00_REPORT      , -- Out :
            FINISH          => S00_FINISH        -- Out :
        );
    ------------------------------------------------------------------------------
    -- AXI4_SLAVE_PLAYER
    ------------------------------------------------------------------------------
    M00: AXI4_SLAVE_PLAYER
        generic map (
            SCENARIO_FILE   => SCENARIO_FILE   ,
            NAME            => "M00"           ,
            READ_ENABLE     => TRUE            ,
            WRITE_ENABLE    => TRUE            ,
            OUTPUT_DELAY    => DELAY           ,
            WIDTH           => M00_WIDTH       ,
            SYNC_PLUG_NUM   => 3               ,
            SYNC_WIDTH      => SYNC_WIDTH      ,
            GPI_WIDTH       => GPI_WIDTH       ,
            GPO_WIDTH       => GPO_WIDTH       ,
            FINISH_ABORT    => FALSE
        )
        port map(
        ---------------------------------------------------------------------------
        -- グローバルシグナル.
        ---------------------------------------------------------------------------
            ACLK            => ap_clk          , -- In  :
            ARESETn         => ap_rst_n        , -- In  :
        ---------------------------------------------------------------------------
        -- リードアドレスチャネルシグナル.
        ---------------------------------------------------------------------------
            ARADDR          => M00_AXI_araddr  , -- In  :    
            ARLEN           => M00_AXI_arlen   , -- In  :    
            ARSIZE          => M00_AXI_arsize  , -- In  :    
            ARBURST         => M00_AXI_arburst , -- In  :    
            ARLOCK          => M00_AXI_arlock  , -- In  :    
            ARCACHE         => M00_AXI_arcache , -- In  :    
            ARPROT          => M00_AXI_arprot  , -- In  :    
            ARQOS           => M00_AXI_arqos   , -- In  :    
            ARREGION        => M00_AXI_arregion, -- In  :    
            ARUSER          => M00_AXI_aruser  , -- In  :    
            ARID            => M00_AXI_arid    , -- In  :    
            ARVALID         => M00_AXI_arvalid , -- In  :    
            ARREADY         => M00_AXI_arready , -- I/O : 
        ---------------------------------------------------------------------------
        -- リードデータチャネルシグナル.
        ---------------------------------------------------------------------------
            RLAST           => M00_AXI_rlast   , -- I/O : 
            RDATA           => M00_AXI_rdata   , -- I/O : 
            RRESP           => M00_AXI_rresp   , -- I/O : 
            RUSER           => M00_AXI_ruser   , -- I/O : 
            RID             => M00_AXI_rid     , -- I/O : 
            RVALID          => M00_AXI_rvalid  , -- I/O : 
            RREADY          => M00_AXI_rready  , -- In  :    
        ---------------------------------------------------------------------------
        -- ライトアドレスチャネルシグナル.
        ---------------------------------------------------------------------------
            AWADDR          => M00_AXI_awaddr  , -- In  :    
            AWLEN           => M00_AXI_awlen   , -- In  :    
            AWSIZE          => M00_AXI_awsize  , -- In  :    
            AWBURST         => M00_AXI_awburst , -- In  :    
            AWLOCK          => M00_AXI_awlock  , -- In  :    
            AWCACHE         => M00_AXI_awcache , -- In  :    
            AWPROT          => M00_AXI_awprot  , -- In  :    
            AWQOS           => M00_AXI_awqos   , -- In  :    
            AWREGION        => M00_AXI_awregion, -- In  :    
            AWUSER          => M00_AXI_awuser  , -- In  :    
            AWID            => M00_AXI_awid    , -- In  :    
            AWVALID         => M00_AXI_awvalid , -- In  :    
            AWREADY         => M00_AXI_awready , -- I/O : 
        ---------------------------------------------------------------------------
        -- ライトデータチャネルシグナル.
        ---------------------------------------------------------------------------
            WLAST           => M00_AXI_wlast   , -- In  :    
            WDATA           => M00_AXI_wdata   , -- In  :    
            WSTRB           => M00_AXI_wstrb   , -- In  :    
            WUSER           => M00_AXI_wuser   , -- In  :    
            WID             => M00_AXI_wid     , -- In  :    
            WVALID          => M00_AXI_wvalid  , -- In  :    
            WREADY          => M00_AXI_wready  , -- I/O : 
        --------------------------------------------------------------------------
        -- ライト応答チャネルシグナル.
        --------------------------------------------------------------------------
            BRESP           => M00_AXI_bresp   , -- I/O : 
            BUSER           => M00_AXI_buser   , -- I/O : 
            BID             => M00_AXI_bid     , -- I/O : 
            BVALID          => M00_AXI_bvalid  , -- I/O : 
            BREADY          => M00_AXI_bready  , -- In  :    
        ---------------------------------------------------------------------------
        -- シンクロ用信号
        ---------------------------------------------------------------------------
            SYNC(0)         => SYNC(0)         , -- I/O :
            SYNC(1)         => SYNC(1)         , -- I/O :
        --------------------------------------------------------------------------
        -- GPIO
        --------------------------------------------------------------------------
            GPI             => M00_GPI         , -- In  :
            GPO             => M00_GPO         , -- Out :
        --------------------------------------------------------------------------
        -- 各種状態出力.
        --------------------------------------------------------------------------
            REPORT_STATUS   => M00_REPORT      , -- Out :
            FINISH          => M00_FINISH        -- Out :
    );
    -------------------------------------------------------------------------------
    --
    -------------------------------------------------------------------------------
    O: AXI4_STREAM_SLAVE_PLAYER                  -- 
        generic map (                            -- 
            SCENARIO_FILE   => SCENARIO_FILE   , --
            NAME            => "OUT"           , --
            OUTPUT_DELAY    => DELAY           , --
            SYNC_PLUG_NUM   => 4               , --
            WIDTH           => OUT_WIDTH       , --
            SYNC_WIDTH      => SYNC_WIDTH      , --
            GPI_WIDTH       => GPI_WIDTH       , --
            GPO_WIDTH       => GPO_WIDTH       , --
            FINISH_ABORT    => FALSE             --
        )                                        -- 
        port map(                                -- 
            ACLK            => ap_clk          , -- In  :
            ARESETn         => ap_rst_n        , -- In  :
            TDATA           => outs_tdata      , -- In  :
            TSTRB           => outs_tkeep      , -- In  :
            TKEEP           => outs_tkeep      , -- In  :
            TUSER           => outs_tuser      , -- In  :
            TDEST           => outs_tdest      , -- In  :
            TID             => outs_tid        , -- In  :
            TLAST           => outs_tlast(0)   , -- In  :
            TVALID          => outs_tvalid     , -- In  :
            TREADY          => outs_tready     , -- Out :
            SYNC            => SYNC            , -- Inou:
            GPI             => OUT_GPI         , -- In  :
            GPO             => OUT_GPO         , -- Out :
            REPORT_STATUS   => OUT_REPORT      , -- Out :
            FINISH          => OUT_FINISH        -- Out :
        );                                       -- 
    -------------------------------------------------------------------------------
    -- 
    -------------------------------------------------------------------------------
    process begin
        ap_clk <= '0';
        wait for PERIOD / 2;
        ap_clk <= '1';
        wait for PERIOD / 2;
    end process;

    ap_rst_n   <= '1' when (RESET = '0') else '0';
    S00_GPI(0) <= interrupt;
    S00_GPI(S00_GPI'high downto 1) <= (S00_GPI'high downto 1 => '0');
    M00_GPI    <= (others => '0');
    OUT_GPI    <= (others => '0');
    active_frame_V(0) <= S00_GPO(0);
    active_frame_V(1) <= S00_GPO(1);
    process
        variable L   : LINE;
        constant T   : STRING(1 to 7) := "  ***  ";
    begin
        wait until (S00_FINISH'event and S00_FINISH = '1');
        wait for DELAY;
        WRITE(L,T);                                                     WRITELINE(OUTPUT,L);
        WRITE(L,T & "ERROR REPORT " & NAME);                            WRITELINE(OUTPUT,L);
        WRITE(L,T & "[ S00 ]");                                         WRITELINE(OUTPUT,L);
        WRITE(L,T & "  Error    : ");WRITE(L,S00_REPORT.error_count   );WRITELINE(OUTPUT,L);
        WRITE(L,T & "  Mismatch : ");WRITE(L,S00_REPORT.mismatch_count);WRITELINE(OUTPUT,L);
        WRITE(L,T & "  Warning  : ");WRITE(L,S00_REPORT.warning_count );WRITELINE(OUTPUT,L);
        WRITE(L,T);                                                     WRITELINE(OUTPUT,L);
        WRITE(L,T & "[ M00 ]");                                         WRITELINE(OUTPUT,L);
        WRITE(L,T & "  Error    : ");WRITE(L,M00_REPORT.error_count   );WRITELINE(OUTPUT,L);
        WRITE(L,T & "  Mismatch : ");WRITE(L,M00_REPORT.mismatch_count);WRITELINE(OUTPUT,L);
        WRITE(L,T & "  Warning  : ");WRITE(L,M00_REPORT.warning_count );WRITELINE(OUTPUT,L);
        WRITE(L,T);                                                     WRITELINE(OUTPUT,L);
        WRITE(L,T & "[ OUT ]");                                         WRITELINE(OUTPUT,L);
        WRITE(L,T & "  Error    : ");WRITE(L,OUT_REPORT.error_count   );WRITELINE(OUTPUT,L);
        WRITE(L,T & "  Mismatch : ");WRITE(L,OUT_REPORT.mismatch_count);WRITELINE(OUTPUT,L);
        WRITE(L,T & "  Warning  : ");WRITE(L,OUT_REPORT.warning_count );WRITELINE(OUTPUT,L);
        WRITE(L,T);                                                     WRITELINE(OUTPUT,L);
        assert FALSE report "Simulation complete." severity FAILURE;
        wait;
    end process;
end MODEL;
