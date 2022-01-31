//
//  LocalStorageProvider.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 31/01/22.
//

import Foundation
import CoreData

protocol NSManagedObjectContextContract {
    func fetchRequest<T>(_ request: NSFetchRequest<T>) throws -> [T]
    @discardableResult
    func executeRequest(_ request: NSPersistentStoreRequest) throws -> NSPersistentStoreResult
    func saveContext() throws
}

extension NSManagedObjectContext: NSManagedObjectContextContract {

    @discardableResult
    func fetchRequest<T>(_ request: NSFetchRequest<T>) throws -> [T] {
        return try self.fetch(request)
    }
    
    @discardableResult
    func executeRequest(_ request: NSPersistentStoreRequest) throws -> NSPersistentStoreResult {
        return try self.execute(request)
    }
    
    func saveContext() throws {
        try save()
    }
}
