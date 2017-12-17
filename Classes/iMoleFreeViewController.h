//
//  iMoleFreeViewController.h
//  iMoleFree
//
//  Created by Carlo Macor on 02/02/10.
//  Copyright Carlo Macor 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#define NUMLABELMENU	6
#define NUMMAXBUCHE    20
#define NUMSOUNDS      10

@interface iMoleFreeViewController : UIViewController  <UITextFieldDelegate>  {

	
	NSInteger	gameState;					//n
	NSInteger   sceltamenu;					//n
	
    // della demo
	UIButton    *OtherGamesButton;
	UIButton    *BuyGamesButton;

	
	// Menu
	UIImage		*img_sfondomenu;				UIImageView	*View_sfondomenu;    
	UIImage		*img_sfondogame;				UIImageView	*View_sfondogame;     
    UIImage 	*img_opzione;
	UIImage 	*img_opzioneh;
	UIImage 	*img_panel;                     UIImageView	*View_panel; 
    float       f_scaleinfopanel;					//n
	
	UIImage		*img_gameOver;				    UIImageView	*View_gameOver;				// Game Over
	
	// pannellino
	UIImage		*img_panlat;				    UIImageView	*View_panlat;
	UIImage		*img_talpanel;			    	UIImageView	*View_talpanel;
	UIImage		*img_pauselat;	
	UIImage		*img_pausehlat;		 	        UIImageView	*View_pauselat;
	UIImage		*img_backlat;				   
	UIImage		*img_backhlat;                  UIImageView	*View_backlat;
	UIImageView	*View_sveglialat;
	UIImage		*img_coin;					    UIImageView	*View_coin;				   
	
	
	UIImageView	*View_opzionemenu[NUMLABELMENU];  
	UILabel     *labM[NUMLABELMENU];
	
	
	
	// Tutorial
	UIImage		*img_freccia;				   
	UILabel     *lab_Tut[9];
	UIImageView	*View_Tut[21];  
	
	
	
	// confermaerase
	UIImageView	*View_panelerase;  
	UIButton    *OKeraseButton;
	UIButton    *CanceleraseButton;
	UILabel     *Laberase1;
	UILabel     *Laberase2;
	
	
	// bottoni
    UIImageView	*View_backbut;
	
	UIImage 	*img_digits[11];
	UIImageView	*View_digitnumtalpe[6];  
	UIImageView	*View_digittime[5];  
	UIImageView	*View_digitbonus[6];  
	UIImageView	*View_digitpunti[8];  
	
	
	UIImage 	*img_buca;
	UIImage 	*img_talpa[7];
	UIImage 	*img_talpah[7];
	UIImageView	*View_buche       [NUMMAXBUCHE];  
	UIImageView	*View_talpabuche  [NUMMAXBUCHE];  
	UIImageView	*View_3talpe      [3];  
	
	CGPoint     ptbuche           [NUMMAXBUCHE];		//n
	CGPoint     pttalpainiziale   [NUMMAXBUCHE];		//n
	int         sequeszatalpa1[17];					//n
	int         sequeszatalpa2[12];					//n
	int         sequeszatalpa3[12];					//n
	int         sequeszatalpa4[13];					//n
	
	
	
	// saved in defstore   1 Key_intcomp1
	// visibilita'
	bool        b_bucaAttiva      [NUMMAXBUCHE];	//$
	bool        b_talpone         [NUMMAXBUCHE];	//$
	bool        b_bucaColpita     [NUMMAXBUCHE];	//$
	int         i_loctimetrafoto  [NUMMAXBUCHE];	//$
	int         i_maxtimetrafoto  [NUMMAXBUCHE];	//$
	int         i_currentsequenza [NUMMAXBUCHE];	//$
	
	// saved in defstore   1 Key_intcomp2
	int         i_currentfoto     [NUMMAXBUCHE];	//$
	int         i_30timenext      [NUMMAXBUCHE];	//$
	
	
	// sveglia
	CGPoint     ptsveglia;					    //$
	bool        b_attivasveglia;				//$
	bool        b_colpitasveglia;				//$
	int         i_30timesveglia;				//$
	int         i_30timenextsveglia;			//$
	int         i_bonustimesveglia;				//$
	int         i_bonustimefruits;				//$
	UIImage 	*img_sveglia;					//n
	UIImageView	*View_sveglia;					//n
	
	
	// Bonus
	bool        b_attivobonus[6];               //$
	bool        b_colpitobonus[6];              //$
    int         i_30timebonus[6];				//$
	int         i_30timenextbonus[6];			//$
	bool        b_trisnonus[3];					//$
	UIImage 	*img_bonus[6];					//n
	UIImageView	*View_bonus[6];					//n
	CGPoint     ptbonus[6];						//n
	UIImageView	*View_littlebonus[3];           //n
	
	
	
	int         i_30nextbucaappear;					//$
    bool        b_tuttelebuchevisibili;				//$
	
	
	UIImageView	*Pagina1;    // per le immagini menu
	UIImageView	*Pagina2;    // per immagini gioco in azione
	UIImageView	*Pagina3;    // i pannelli info, record, setup
	UIImageView	*Pagina4;    // il sopra pannelli info , record, setup
	UIImageView	*Pagina5;    // tutto il super sopra  Back menu, ecc...
	
	CGPoint     pos_butbackmenu;					//n
	
	// saved in defstore   3
	bool        b_mancino;								//$
	bool        b_inpausa;								//$
	bool        b_gameover;								//$
	float       f_soundlevel;							//$
	bool        b_primaapertura;						//n
	bool        b_presachiara;							//$
	
	// esplosioncina
    bool        b_inexplosione;					//$
	int         i_30explosiontime;				//$
	UIImage 	*img_esposione;    	UIImageView	*View_esplosione;   	//n
    bool        b_intripletta;					//$
	int         i_30tripletta;					//$
	
	bool        b_arrivatasveglia;				//$
	int         i_30arrivatasveglia;			//$
	
	CGPoint     pos_butbackpanel;	            //n
	CGPoint     pos_butpausepanel;	            //n
	
	int         i_dimbutbackmenu2;				//n
	int         i_butbackpanel2;				//n
	int         i_butpausepanel2;				//n
	
	// saved in defstore   5
	int         i_gamelevel;					//$
	int         i_numbonus;						//$	
	int         i_numtalpeprese;				//$
	int         i_numsecondigame;				//$
	int         i_punti;						//$
	
	
	
	int         i_ypostalpinapanel;				//n
	int         i_xgoingtopanel;				//n
	
	// label pannelli
	UILabel     *Label_info[5];
	UILabel     *Label_records[20];
	UILabel     *Label_recordpoints[16];
	UILabel     *Label_setup[5];
	UISlider    *SlideVolume;
	UISwitch    *SwitchLR;
	UIButton    *ResetButton;
	UIButton    *ResetButtonNomi;
	
	
    // testi	
	UITextField	*textFieldNomi[3];					//n
    NSString    *String_nomeplayer[3];              //$
	NSString    *Str_nomirecords[16];				//$
	
	
	// Records
	int         i_pointrecords[16];					//$
	int         i_UltimoRecord[3];					//$
	int         i_indicenomeplayer;					//$
    int         i_introducedrecord[3];				//n
	int         i_30timegameoverNewrecord;			//n
	bool        b_fromgameopenrecord;				//n
	bool        b_erasedata;						//n
	NSThread      *soundPlayerThread;				//n
	AVAudioPlayer *effectPlayer[NUMSOUNDS];			//n
	float         f_volindice[NUMSOUNDS];			//n
	bool        b_sobonus1;							//n alterna sound 
	bool        b_sotalpa1;                         //n alterna sound 
	
	
	// data to save
	NSString    *Key_nomeplayer [ 3] ;
	NSString    *Key_nomerecords[16] ;
	NSString    *Key_intrecords [16] ;
	NSString    *Key_boolsetup  [ 3] ;
	NSString    *Key_intsetup        ;
	NSString    *Key_intvalgame [ 5] ;
	NSString    *Key_intlastpalyer   ;
	NSString    *Key_primaapertura   ;
	NSString    *Key_intrecordlast[3];
	NSString    *Key_intcomp1   [NUMMAXBUCHE] ;
	NSString    *Key_intcomp2   [NUMMAXBUCHE] ;
	
	
	NSString    *Key_intdata    [22] ;  // 40 da limitare
	NSString    *Key_booldata   [22] ;  // 40 da limitare
	
	NSString    *Key_floatdata  [14] ;  // 40 da limitare
	
	
}


@property(nonatomic) NSInteger		gameState;
@property(nonatomic) NSInteger		sceltamenu;

- (void) fissavariabili;

@end

