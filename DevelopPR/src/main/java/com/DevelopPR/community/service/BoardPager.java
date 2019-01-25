package com.DevelopPR.community.service;

public class BoardPager {
    // �������� �Խù� ��
    public static final int PAGE_SCALE = 10;
    // ȭ��� ������ ��
    public static final int BLOCK_SCALE = 10;
    private int curPage; // ���� ���̼�
    private int prevPage; // ���� ������
    private int nextPage; // ���� ������
    private int totPage; // ��ü ������ ����
    private int totBlock; // ��ü ������ ��� ����
    private int curBlock; // ���� ������ ��� 
    private int prevBlock; // ���� ������ ���
    private int nextBlock; // ���� ������ ���
    // WHERE rn BETWEEN #{start} AND #{end}
    private int pageBegin; // #{start}
    private int pageEnd; // #{end}
    // [����] blockBegin -> 41 42 43 44 45 46 47 48 49 50 [����]
    private int blockBegin; // ���� ������ ����� ���۹�ȣ
    // [����] 41 42 43 44 45 46 47 48 49 50 <- blockEnd [����]
    private int blockEnd; // ���� ������ ����� ����ȣ
    
    // ������
    // BoardPager(���ڵ� ����, ���� ������ ��ȣ)
    public BoardPager(int count, int curPage){
        curBlock = 1; // ���� ������ ��� ��ȣ
        this.curPage = curPage; // ���� ������ ����
        setTotPage(count); // ��ü ������ ���� ���
        setPageRange(); // 
        setTotBlock(); // ��ü ������ ��� ���� ���
        setBlockRange(); // ������ ����� ����, �� ��ȣ ���
    }
    
    public void setBlockRange(){
        // *���� �������� ���° ������ ��Ͽ� ���ϴ��� ���
        curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
        // *���� ������ ����� ����, �� ��ȣ ���
        blockBegin = (curBlock-1)*BLOCK_SCALE+1;
        // ������ ����� ����ȣ
        blockEnd = blockBegin+BLOCK_SCALE-1;
        // *������ ����� ������ �ʰ����� �ʵ��� ���
        if(blockEnd > totPage) blockEnd = totPage;
        // *������ ������ �� �̵��� ������ ��ȣ
        prevPage = (curPage == 1)? 1:(curBlock-1)*BLOCK_SCALE;
        // *������ ������ �� �̵��� ������ ��ȣ
        nextPage = curBlock > totBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
        // ������ �������� ������ �ʰ����� �ʵ��� ó��
        if(nextPage >= totPage) nextPage = totPage;
    }
    
    public void setPageRange(){
    // WHERE rn BETWEEN #{start} AND #{end}
        // ���۹�ȣ = (����������-1)*�������� �Խù��� +1
        pageBegin = (curPage-1)*PAGE_SCALE+1;
        // ����ȣ = ���۹�ȣ+�������� �Խù��� -1
        pageEnd = pageBegin+PAGE_SCALE-1;
    }
    
    // Getter/Setter
    public int getCurPage() {
        return curPage;
    }
    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }
    public int getPrevPage() {
        return prevPage;
    }
    public void setPrevPage(int prevPage) {
        this.prevPage = prevPage;
    }
    public int getNextPage() {
        return nextPage;
    }
    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }
    public int getTotPage() {
        return totPage;
    }
    public void setTotPage(int count) {
        // Math.ceil(�Ǽ�) �ø� ó��
        totPage = (int) Math.ceil(count*1.0 / PAGE_SCALE);
    }
    public int getTotBlock() {
        return totBlock;
    }
    // ������ ����� ���� ���(�� 100��������� 10���� ���)
    public void setTotBlock() {
        // ��ü ������ ���� / 10
        // 91 / 10 => 9.1 => 10��
        totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
    }
    
    public int getCurBlock() {
        return curBlock;
    }
    public void setCurBlock(int curBlock) {
        this.curBlock = curBlock;
    }
    public int getPrevBlock() {
        return prevBlock;
    }
    public void setPrevBlock(int prevBlock) {
        this.prevBlock = prevBlock;
    }
    public int getNextBlock() {
        return nextBlock;
    }
    public void setNextBlock(int nextBlock) {
        this.nextBlock = nextBlock;
    }
    public int getPageBegin() {
        return pageBegin;
    }
    public void setPageBegin(int pageBegin) {
        this.pageBegin = pageBegin;
    }
    public int getPageEnd() {
        return pageEnd;
    }
    public void setPageEnd(int pageEnd) {
        this.pageEnd = pageEnd;
    }
    public int getBlockBegin() {
        return blockBegin;
    }
    public void setBlockBegin(int blockBegin) {
        this.blockBegin = blockBegin;
    }
    public int getBlockEnd() {
        return blockEnd;
    }
    public void setBlockEnd(int blockEnd) {
        this.blockEnd = blockEnd;
    }
    
    
}
 
