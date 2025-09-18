package com.borieyulmu.gbook.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.borieyulmu.gbook.entity.GuestBook;

public interface GuestBookRepository extends JpaRepository<GuestBook, Integer> {
    
}
