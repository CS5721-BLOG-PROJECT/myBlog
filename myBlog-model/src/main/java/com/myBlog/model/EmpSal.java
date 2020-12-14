package com.myBlog.model;

import java.util.Objects;

public class EmpSal {

    private Integer id;
    private String name;
    private Integer totalWages;
    private Integer dayOff;
    private Integer insuraceFee;
    private Integer deduction;
    private Integer netSal;

    public EmpSal() {
    }

    public EmpSal(Integer id, String name, Integer totalWages, Integer dayOff, Integer insuraceFee, Integer deduction, Integer netSal) {
        this.id = id;
        this.name = name;
        this.totalWages = totalWages;
        this.dayOff = dayOff;
        this.insuraceFee = insuraceFee;
        this.deduction = deduction;
        this.netSal = netSal;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getTotalWages() {
        return totalWages;
    }

    public void setTotalWages(Integer totalWages) {
        this.totalWages = totalWages;
    }

    public Integer getDayOff() {
        return dayOff;
    }

    public void setDayOff(Integer dayOff) {
        this.dayOff = dayOff;
    }

    public Integer getInsuraceFee() {
        return insuraceFee;
    }

    public void setInsuraceFee(Integer insuraceFee) {
        this.insuraceFee = insuraceFee;
    }

    public Integer getDeduction() {
        return deduction;
    }

    public void setDeduction(Integer deduction) {
        this.deduction = deduction;
    }

    public Integer getNetSal() {
        return netSal;
    }

    public void setNetSal(Integer netSal) {
        this.netSal = netSal;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EmpSal empSal = (EmpSal) o;
        return Objects.equals(id, empSal.id) &&
                Objects.equals(name, empSal.name) &&
                Objects.equals(totalWages, empSal.totalWages) &&
                Objects.equals(dayOff, empSal.dayOff) &&
                Objects.equals(insuraceFee, empSal.insuraceFee) &&
                Objects.equals(deduction, empSal.deduction) &&
                Objects.equals(netSal, empSal.netSal);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, totalWages, dayOff, insuraceFee, deduction, netSal);
    }
}
