// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_texts(){
	switch npcName {
		case "titi":
			ds_grid_add_text("É impressão minha, ou você acabou de sair daquela árvore?", spr_portrait_titi_shocked, 0, "Titi");
			
			ds_grid_add_text("Aiii, que merda.", spr_portrait_player_pain, 1, "Você");
			
			ds_grid_add_text("Caralho mano, eu preciso parar de fumar...", spr_portrait_titi_sideLook, 0, "Titi");
			
			ds_grid_add_text("Onde é que eu tô?", spr_portrait_player_confused, 1, "Você");
			
			ds_grid_add_text("Bem vindo à Vila Gaivota. Aqui é um buraco, não consigo nem arrumar uma cervejinha.", spr_portrait_titi_disgusted, 0, "Titi");
			
			ds_grid_add_text("Como é que eu saio daqui?", spr_portrait_player_confused, 1, "Você");
			ds_grid_add_text("Ai minha cabeça...", spr_portrait_player_pain, 1, "Você");
			
			ds_grid_add_text("Olha amigo, eu não sei de nada não. Você vai ter que conversar com o Rogério.", spr_portrait_titi_serious, 0, "Titi");
			
			ds_grid_add_text("Rogério, beleza. Muito obrigado.", spr_portrait_player_smile, 1, "Você");
			ds_grid_add_text("...Quem é Rogério?", spr_portrait_player_confused, 1, "Você");
			
			ds_grid_add_text("Tá achando que a vida é de graça, rapá? Se você arrumar uma cervejinha pro teu pai, aí sim eu te ajudo.", spr_portrait_titi_angry, 0, "Titi");
				
				add_op("Ah mano, tá. Onde eu arrumo isso?", "Resposta1");
				add_op("WTF? Claro que não. Vou procurar ajuda em outro lugar.", "Resposta2");
				
		break;
		
		//=======================================================================
		
				case "Resposta1":
					ds_grid_add_text("Valeu demais, primo. Você vai descer aqui, virar a direita e subir.", spr_portrait_titi_smile, 0, "Titi");
					
					ds_grid_add_text("Beleza.", spr_portrait_player_ugh, 1, "Você");
					
					obj_npc_titi.nname = "titi2";
					tavernWarp.enabled = 1;
					
				break;
				
				//=======================================================================
				
				case "Resposta2":
					ds_grid_add_text("Ah rapaz, o dia em que alguém desse lugar te ajudar, minha bola esquerda volta.", spr_portrait_titi_serious, 0, "Titi");
					ds_grid_add_text("...Quer dizer...", spr_portrait_titi_shocked, 0, "Titi");
					ds_grid_add_text("Ah, deixa pra lá.", spr_portrait_titi_sideLook, 0, "Titi");
					
					obj_npc_titi.nname = "titi3";
				break;
				
		//=======================================================================
				
		case "titi2":
			ds_grid_add_text("Já comprou?", spr_portrait_titi_talking, 0, "Titi");
			
			ds_grid_add_text("Ainda não.", spr_portrait_player_ugh, 1, "Você");
		break;
		
		//=======================================================================
		
		case "titi3":
			ds_grid_add_text("Voltou, né? Vai pegar uma cervejinha pro teu pai agora?", spr_portrait_titi_talking, 0, "Titi");
			
				add_op("Ah mano, tá. Onde eu arrumo isso?", "Resposta1");
				add_op("Não.", "titi4");
		break;
		
		//=======================================================================
		
		case "titi4":
			ds_grid_add_text("Então tá.", spr_portrait_titi_serious, 0, "Titi");
			
				obj_npc_titi.nname = "titi3";
				
		break;
		
		//=======================================================================
		
		case "titi5":
			
			ds_grid_add_text("Toma.", spr_portrait_player_ugh, 1, "Você");
			
			ds_grid_add_text("Pô, valeu demais hein parça!", spr_portrait_titi_talking, 0, "Titi");
			ds_grid_add_text("Olha, você vai precisar de contornar a lagoa, embaixo da mineração.", spr_portrait_titi_smile, 0, "Titi");
			ds_grid_add_text("...Glub glub", spr_portrait_titi_drink, 0, "Titi");
			ds_grid_add_text("Quem vive sem uma brejinha, né?", spr_portrait_titi_talking, 0, "Titi");
			ds_grid_add_text("Enfim, quando você for falar com o Rogério, fala pra ele que ele é cheiroso.", spr_portrait_titi_talking, 0, "Titi");
			
			ds_grid_add_text("...?", spr_portrait_player_confused, 1, "Você");
			
			ds_grid_add_text("Só confia, beleza?", spr_portrait_titi_talking, 0, "Titi");
			
			ds_grid_add_text("Err... Okay...", spr_portrait_player_confused, 1, "Você");
			
				obj_courier.beer = 0;
				obj_npc_titi.nname = "titi6";
			
		break;
		
		//=======================================================================
		
		case "titi6":
			ds_grid_add_text("Boa sorte, primo!", spr_portrait_titi_talking, 0, "Titi");
				
		break;
		
		//=======================================================================
		
		case "mik":
			ds_grid_add_text("What is this racket?", spr_portrait_mik_angry, 0, "Mik");
			ds_grid_add_text("...", spr_portrait_mik_sidelook, 0, "Mik");
			ds_grid_add_text("Wait, who are you? Did you... Kill Domingaiser??", spr_portrait_mik_confused, 0, "Mik");
			
			ds_grid_add_text("Uhh... I think so?", spr_portrait_player_confused, 1, "Você");
			ds_grid_add_text("I'm Céu", spr_portrait_player_smile, 1, "Você");
			
			ds_grid_add_text("No way! I'd been wanting that guy gone for YEARS now. He's so noisy and obnoxious.", spr_portrait_mik_ugh, 0, "Mik");
			ds_grid_add_text("I had to move all the way down here because everyone upstairs is so strange!", spr_portrait_mik_heh, 0, "Mik");
			ds_grid_add_text("They eat rice and beans and use this weird thing called Celium? Celsius?", spr_portrait_mik_heh, 0, "Mik");
			ds_grid_add_text("I mean, is there any other way to measure things besides parakeets per pizza??", spr_portrait_mik_confused, 0, "Mik");
			ds_grid_add_text("...", spr_portrait_mik_sidelook, 0, "Mik");
			ds_grid_add_text("Anyways, thank you loads, man! Is there anything I can do for you in return?", spr_portrait_mik_happy, 0, "Mik");
			
				add_op("Uhh, yeah, actually! Could you sign this?", "mik2");
			
				obj_npc_mik.nname = "mik2";
		break;
		
		//=======================================================================
		
		case "mik2":
			ds_grid_add_text("Yours is the last signature I need!", spr_portrait_player_smile, 1, "Você");
			
			ds_grid_add_text("Sure!", spr_portrait_mik_smile, 0, "Mik");
			
				obj_sigCount.sigAmount++;
				
				wait(10);
				obj_player.walkSpeed = 5;
				fade_to_room2(rm_gameMain, 60, c_black, 4960, 128, obj_fade);
				
		break;
		
		//=======================================================================
		
		case "ceci":
			ds_grid_add_text("Celinho, estava te procurando.", spr_portrait_ceci_happy, 0, "Ceci");
			ds_grid_add_text("Preciso que você saia rapidinho antes do povo chegar.", spr_portrait_ceci_talking, 0, "Ceci");
			ds_grid_add_text("A Lola sumiu de novo e ela tem horário marcado na pet pra tomar banho. Ela precisa ficar limpinha pro Natal.", spr_portrait_ceci_worried, 0, "Ceci");
		
			ds_grid_add_text("Poxa mãe, de novo?", spr_portrait_player_ugh, 1, "Você");
			ds_grid_add_text("Já olharam na piscina?", spr_portrait_player_confused, 1, "Você");
		
			ds_grid_add_text("Já", spr_portrait_ceci_worried, 0, "Ceci");
		
			ds_grid_add_text("Okay, que horas que o povo vai chegar?", spr_portrait_player_confused, 1, "Você");
		
			ds_grid_add_text("Daqui a pouco, Célio! Anda!", spr_portrait_ceci_angry, 0, "Ceci");
		
			ds_grid_add_text("Okay, okay, estou indo.", spr_portrait_player_confused, 1, "Você");
		
				obj_player.walkSpeed = 5;

		break;
		
		//=======================================================================
			
		case "za":
		
			ds_grid_add_text("Oi, bom dia, eu gostaria de pedir por favor uma-", spr_portrait_player_smile, 1, "Você");
		
			ds_grid_add_text("!!!", spr_portrait_za_serious, 0, "Zá");
			ds_grid_add_text("Não atendemos gente da sua... espécie.", spr_portrait_za_serious, 0, "Zá");
			ds_grid_add_text("Vá embora.", spr_portrait_za_serious, 0, "Zá");
			
				obj_npc_za.nname = "za2";
				obj_courier.breno = "breno2";

		break;
		
		//=======================================================================
			
		case "za2":
		
			ds_grid_add_text("Já disse pra você ir embora.", spr_portrait_za_serious, 0, "Zá");

		break;
		
		//=======================================================================
			
		case "za3":
		
			ds_grid_add_text("Já disse pra você ir emb-.", spr_portrait_za_serious, 0, "Zá");
			ds_grid_add_text("Ah, me desculpe!.", spr_portrait_za_serious, 0, "Zá");
			ds_grid_add_text("O que posso fazer por você hoje?", spr_portrait_za_smile, 0, "Zá");
			
			ds_grid_add_text("Eu gostaria de pedir uma cerveja, por favor", spr_portrait_player_heh, 1, "Você");
			
			ds_grid_add_text("Claro, claro! E ela será gratuita.", spr_portrait_za_smile, 0, "Zá");
			ds_grid_add_text("...Pelo transtorno", spr_portrait_za_serious, 0, "Zá");
			
				obj_courier.beer = 1;
			

		break;
		
		//=======================================================================
			
		case "breno":
		
			ds_grid_add_text("...", spr_portrait_player_confused, 1, "Você");
		
			ds_grid_add_text("Não tá vendo que eu estou ocupado?!", spr_portrait_breno_angry, 0, "Breno");

		break;
		
		//=======================================================================
			
		case "breno2":
		
			ds_grid_add_text("Mas que SACO, não tá vendo que eu tô ocupado??", spr_portrait_breno_angry, 0, "Breno");
			ds_grid_add_text("O que você quer?", spr_portrait_breno_normal, 0, "Breno");
			
			ds_grid_add_text("É... Desculpa, eu poderia pegar um pouco da sua tinta emprestada?", spr_portrait_player_confused, 1, "Você");
			
			ds_grid_add_text("O cara vem aqui me encher o saco, PISA NA MINHA GRAMA, e ainda quer minha tinta 'emprestada'???", spr_portrait_breno_angry, 0, "Breno");
			ds_grid_add_text("E CONTINUA NA MINHA GRAMA!!", spr_portrait_breno_veryAngry, 0, "Breno");
			ds_grid_add_text("...", spr_portrait_breno_normal, 0, "Breno");
			ds_grid_add_text("Quer saber? Te empresto sim, mas você vai precisar de me fazer um favor primeiro.", spr_portrait_breno_normal, 0, "Breno");
			
			ds_grid_add_text("Isso de novo??", spr_portrait_player_ugh, 1, "Você");
			ds_grid_add_text("Qual que é esse favor?", spr_portrait_player_confused, 1, "Você");
			
			ds_grid_add_text("Esses MERDAS que moram aqui são ignorantes que nem você.", spr_portrait_breno_veryAngry, 0, "Breno");
			ds_grid_add_text("Eu estou querendo privatizar a grama faz um tempo já. Preciso que você arrume as assinaturas de todo mundo pra mim.", spr_portrait_breno_veryAngry, 0, "Breno");
			ds_grid_add_text("Já consegui as assinaturas do Zá e do Titi. E a minha, obviamente.", spr_portrait_breno_normal, 0, "Breno");
			
			ds_grid_add_text("Lá vou eu de novo...", spr_portrait_player_ugh, 1, "Você");
								
				instance_create_layer(300, 100, "Instances", obj_sigCount);
				obj_courier.breno = "breno3";
				
				obj_courier.sophia = "sophia2";
				obj_courier.vanessa = "vanessa2";
				obj_courier.maria = "maria2";
				
				obj_courier.camilo = "camilo2";
				obj_courier.vinicius = "vinicius3";
			

		break;
		
		//=======================================================================
			
		case "breno3":
		
			ds_grid_add_text("Já conseguiu todas as assinaturas?", spr_portrait_breno_normal, 0, "Breno");
			
			ds_grid_add_text("...Ainda não", spr_portrait_player_ugh, 1, "Você");
			
			ds_grid_add_text("Então por que você veio me encher o saco??", spr_portrait_breno_angry, 0, "Breno");

		break;
		
		//=======================================================================
			
		case "breno4":
		
			ds_grid_add_text("Já conseguiu todas as assinaturas?", spr_portrait_breno_normal, 0, "Breno");
			
			ds_grid_add_text("Agora sim", spr_portrait_player_ugh, 1, "Você");
			
			ds_grid_add_text("Ah, ótimo. Toma aqui sua tinta, agora vaza.", spr_portrait_breno_normal, 0, "Breno");
			
				obj_courier.breno = "breno";
				
				draw_sprite(spr_smoke, 0, obj_player.x, obj_player.y);
				obj_player.verde = 1;
				instance_destroy(obj_sigCount);
				tavernWarp.enabled = 1;

		break;
		
		//=======================================================================
			
		case "sophia":
		
			ds_grid_add_text("Belo dia, não?", spr_portrait_sophia, 0, "Sophia");

		break;
		
		//=======================================================================
			
		case "sophia2":
		
			ds_grid_add_text("Oi, você poderia assinar esse baixo-assinado pra mim?", spr_portrait_player_smile, 1, "Você");
		
			ds_grid_add_text("Claro, claro!", spr_portrait_sophia, 0, "Sophia");
			
				obj_sigCount.sigAmount++;
				obj_courier.sophia = "sophia3";

		break;
		
		//=======================================================================
			
		case "sophia3":
		
			ds_grid_add_text("E aí, conseguiu seu baixo-assinado?", spr_portrait_sophia, 0, "Sophia");

		break;
		
		//=======================================================================
			
		case "vanessa":
		
			ds_grid_add_text("Olá você é pai de algum aluno?", spr_portrait_vanessa, 0, "Vanessa");

		break;
		
		//=======================================================================
			
		case "vanessa2":
		
			ds_grid_add_text("Oi! Eu tenho um baixo-assinado aqui, será que você poderia assinar pra mim?", spr_portrait_player_talking, 1, "Você");
		
			ds_grid_add_text("Hm? ah, sim! Aquele Breno é meio raivosinho...", spr_portrait_vanessa, 0, "Vanessa");
			ds_grid_add_text("Assino sim, pode deixar!", spr_portrait_vanessa, 0, "Vanessa");
			
				obj_sigCount.sigAmount++;
				obj_courier.vanessa = "vanessa3";

		break;
		
		//=======================================================================
			
		case "vanessa3":
		
			ds_grid_add_text("Espero que você consiga as assinaturas que precisa!", spr_portrait_vanessa, 0, "Vanessa");

		break;
		
		//=======================================================================
			
		case "maria":
		
			ds_grid_add_text("Hmmph. O que você quer?", spr_portrait_maria, 0, "Maria");

		break;
		
		//=======================================================================
			
		case "maria2":
		
			ds_grid_add_text("Err... Desculpa, você assinaria isso pra mim?", spr_portrait_player_heh, 1, "Você");
			
			ds_grid_add_text("Aí você vai embora?", spr_portrait_maria, 0, "Maria");
			
				obj_sigCount.sigAmount++;
				obj_courier.maria = "maria3";

		break;
		
		//=======================================================================
			
		case "maria3":
		
			ds_grid_add_text("O que foi agora??", spr_portrait_maria, 0, "Maria");

		break;
		
		//=======================================================================
			
		case "marcos":
		
			ds_grid_add_text("Ei, campeão! Como vai?", spr_portrait_marcos, 0, "Marcos");
			
				add_op("Tudo bem, e você?", "marcos2");
				add_op("Ignorar", "marcos3");
		break;
		
		//=======================================================================
			
		case "marcos2":
		
			ds_grid_add_text("Tudo ótimo!", spr_portrait_marcos, 0, "Marcos");
			
				obj_courier.marcosFeliz = 1;
			
		break;
		
		//=======================================================================
			
		case "marcos3":
		
			ds_grid_add_text("Nossa, que rude...", spr_portrait_marcos, 0, "Marcos");
			
				obj_courier.marcosFeliz = 0;
			
		break;
		
		//=======================================================================
			
		case "marcos4":
		
			ds_grid_add_text("Err... Será que você assinaria isso pra mim?", spr_portrait_player_heh, 1, "Você");
		
			ds_grid_add_text("Depois que você foi tão rude comigo? Nunca!", spr_portrait_marcos_mad, 0, "Marcos");
			
				add_op("Você me perdoa?", "marcos6");
				add_op("Ignorar", "marcos3");
				
		break;
		
		//=======================================================================
			
		case "marcos5":
		
			ds_grid_add_text("Ei, tudo jóia? Você assinaria isso pra mim?", spr_portrait_player_talking, 1, "Você");
		
			ds_grid_add_text("Claro! Você é muito educado.", spr_portrait_marcos_mad, 0, "Marcos");
			
				obj_sigCount.sigAmount++;
				obj_courier.marcosSigned = 1;
				
		break;
		
		//=======================================================================
			
		case "marcos6":
		
			ds_grid_add_text("Hmph. Só dessa vez. Onde eu assino?", spr_portrait_marcos_mad, 0, "Marcos");
			
				obj_sigCount.sigAmount++;
				obj_courier.marcosSigned = 1;
				
		break;
		
		//=======================================================================
			
		case "marcos7":
		
			ds_grid_add_text("E aí, conseguiu?", spr_portrait_marcos, 0, "Marcos");
				
		break;
		
		//=======================================================================
			
		case "camilo":
		
			ds_grid_add_text("Precisando é só chamar!", spr_portrait_camilo, 0, "Camilo");
				
		break;
		
		//=======================================================================
			
		case "camilo2":
		
			ds_grid_add_text("Ei, tudo jóia? Você assinaria isso pra mim?", spr_portrait_player_talking, 1, "Você");
		
			ds_grid_add_text("Claro! Tudo pela Vila Gaivota!", spr_portrait_camilo, 0, "Camilo");
			
				obj_sigCount.sigAmount++;
				obj_courier.camilo = "camilo";
				
		break;
		
		//=======================================================================
			
		case "vinicius":
		
			ds_grid_add_text("Hoje eu só quero um pouco de paz.", spr_portrait_vinicius, 0, "Camilo");
			
				obj_courier.viniCounter++;
				
		break;
		
		//=======================================================================
			
		case "vinicius2":
		
			ds_grid_add_text("EU SÓ QUERIA UM POUCO DE PAZ.", spr_portrait_vinicius_mad, 0, "Camilo");
				
		break;
		
		//=======================================================================
			
		case "vinicius3":
		
			ds_grid_add_text("Err... Prometo te deixar em paz, mas você assinaria isso pra mim?", spr_portrait_player_heh, 1, "Você");
		
			ds_grid_add_text("Aí você vai embora?", spr_portrait_vinicius, 0, "Camilo");
			
			ds_grid_add_text("Sim!", spr_portrait_player_heh, 1, "Você");
			
			ds_grid_add_text("Então me dá aqui logo.", spr_portrait_vinicius, 0, "Camilo");
			
				obj_sigCount.sigAmount++;
				obj_courier.viniSigned = 1;
				
		break;
		
		//=======================================================================
			
		case "vinicius4":
		
			ds_grid_add_text("Você disse que me deixaria em paz.", spr_portrait_vinicius_mad, 0, "Camilo");
				
		break;
		
	}
}

function ds_grid_add_row() {
	var _grid = argument[0];
	ds_grid_resize(_grid, ds_grid_width(_grid), ds_grid_height(_grid)+1);
	return(ds_grid_height(_grid)-1);
}

function ds_grid_add_text() {
	///@arg text
	///@arg portrait
	///@arg side
	///@arg nname
	
	var _grid = textGrid;
	var _y = ds_grid_add_row(_grid);
	
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
	_grid[# 3, _y] = argument[3];
}

function add_op(_text, _answ) {
	op[opNum] = _text;
	opAnswer[opNum] = _answ;
	
	opNum++;
}
	