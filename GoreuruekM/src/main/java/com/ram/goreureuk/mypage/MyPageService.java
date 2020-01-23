package com.ram.goreureuk.mypage;

import java.util.List;

import com.ram.goreureuk.freeboard.FreeBoardLikes;
import com.ram.goreureuk.freeboard.FreeBoardVO;
import com.ram.goreureuk.freeboard.Message;
import com.ram.goreureuk.freeboard.ReplyVO;
import com.ram.goreureuk.member.MemberVO;
import com.ram.goreureuk.member.signUpVO;
import com.ram.goreureuk.recipe.RecipeVO;

public interface MyPageService {
	public MemberVO mypageView(String name);
	
	public List<FreeBoardVO> mypageFreeList(String name);
	
	public List<RecipeVO> mypageRecipeList(String name);
	
	public List<ReplyVO> mypageFreeReply(String name);
	
	public List<com.ram.goreureuk.recipe.ReplyVO> mypageRecipeReply(String name);
	
	public List<FreeBoardLikes> mypageFreeLikes(String name);
	
	public List<FreeBoardVO> mypageFreeLikesList(String code);
	
	public List<RecipeVO> mypageRecipeLikes(String name);
	
	public List<RecipeVO> mypageRecipeLikesList(String code);
	
	//메세지
	public List<Message> mypageMessage(String name);
	
	public signUpVO editView(String name);
	
	public void editPw(signUpVO vo);

	public void DeleteUser(String name);
}
