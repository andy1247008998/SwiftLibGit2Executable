//
//  Blob.swift
//
//
//  Created by ailion on 2020/1/12.
//

import Clibgit2

class Blob {
    
    static func create_from_buffer(repo: OpaquePointer, buffer: UnsafeRawPointer, len: Int) -> (Int32, git_oid) {
        let id = UnsafeMutablePointer<git_oid>.allocate(capacity: 1)
        let error_code = git_blob_create_frombuffer(id, repo, buffer, len)
        return (error_code, id.pointee)
    }
    
    
}