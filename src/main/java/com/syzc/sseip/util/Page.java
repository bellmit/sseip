package com.syzc.sseip.util;

import java.util.LinkedList;
import java.util.List;

public class Page<T> {
    /**
     * pageNo start from 1
     */
    Long pageNo;
    Long maxPageNo;
    Long totalRows;
    Byte pageSize;
    /**
     * rowOffset start from 0
     */
    Long rowOffset;
    List<T> list = new LinkedList<>();

    public Page(Long totalRows) {
        this.totalRows = totalRows;
    }

    public Page() {
    }

    public boolean isFirstPage() {
        return pageNo == 1;
    }

    public boolean isLastPage() {
        return pageNo.equals(maxPageNo);
    }

    public Long getPageNo() {
        return pageNo;
    }

    public void setPageNo(Long pageNo) {
        this.pageNo = pageNo;
    }

    public Long getMaxPageNo() {
        return maxPageNo;
    }

    public void setMaxPageNo(Long maxPageNo) {
        this.maxPageNo = maxPageNo;
    }

    public Long getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(Long totalRows) {
        this.totalRows = totalRows;
    }

    public Byte getPageSize() {
        return pageSize;
    }

    public void setPageSize(Byte pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    /**
     * rowno从0开始计数
     *
     * @return 行号
     */
    public Long getRowOffset() {
        return rowOffset;
    }

    public void setRowOffset(Long rowOffset) {
        this.rowOffset = rowOffset;
    }
}