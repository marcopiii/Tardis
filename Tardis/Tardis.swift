//
//  Tardis.swift
//  Tardis
//
//  Created by aSlug on 22/10/2019.

/// A chronology tracker to save and navigate application states
public class Tardis<Snapshot> {
    
    // MARK: - Private properties
    
    private var snapshots: [Snapshot] = []
    
    private var currentSnapshotIndex: Int = 0
    
    private var currentSnapshot: Snapshot {
        guard !snapshots.isEmpty else {
            fatalError("You are trying to fetch a snapshot from Tardis before saving one.")
        }
        
        return snapshots[currentSnapshotIndex]
    }
    
    // MARK: - Public interface
    
    /// Check if a previous snapshot is present
    public var hasPrevious: Bool {
        return currentSnapshotIndex < snapshots.count - 1
    }
    
    /// Check if a following snapshot is present
    public var hasNext: Bool {
        return currentSnapshotIndex > 0
    }
    
    /// Register a new snapshot.
    ///
    /// If `Tardis.canRedo == true` all the following snapshots will be lost
    public func save(snapshot: Snapshot) {
        snapshots.insert(snapshot, at: currentSnapshotIndex)
        (0..<currentSnapshotIndex).forEach { _ in snapshots.remove(at: 0) }
        currentSnapshotIndex = 0
    }
    
    /// Move to and return the previous snapshot
    ///
    /// If `Tardis.hasPrevious == false` the current snapshot will be returned
    /// - Warning: Trying to use this method before initializing `Tardis` with a `Snapshot` (using `save(snapshot:)` or `reboot(with:)`) will result in a `fatalError`
    public func previous() -> Snapshot {
        guard hasPrevious else { return currentSnapshot }
        
        currentSnapshotIndex += 1
        return currentSnapshot
    }
    
    /// Move to and return the following snapshot
    ///
    /// If `Tardis.hasNext == false` then the current snapshot will be returned
    /// - Warning: Trying to use this method before initializing `Tardis` with a `Snapshot` (using `save(snapshot:)` or `reboot(with:)`) will result in a `fatalError`
    public func next() -> Snapshot {
        guard hasNext else { return currentSnapshot }
        
        currentSnapshotIndex -= 1
        return currentSnapshot
    }
    
    /// Move to and return the oldest snapshot
    ///
    /// If `Tardis.hasPrevious == false` the current snapshot will be returned
    /// - Warning: Trying to use this method before initializing `Tardis` with a `Snapshot` (using `save(snapshot:)` or `reboot(with:)`) will result in a `fatalError`
    public func oldest() -> Snapshot {
        guard hasPrevious else { return currentSnapshot }
        
        currentSnapshotIndex = snapshots.count - 1
        return currentSnapshot
    }
    
    /// Move to and return the latest snapshot
    ///
    /// If `Tardis.hasNext == false` the current snapshot will be returned
    /// - Warning: Trying to use this method before initializing `Tardis` with a `Snapshot` (using `save(snapshot:)` or `reboot(with:)`) will result in a `fatalError`
    public func latest() -> Snapshot {
        guard hasNext else { return currentSnapshot }
        
        currentSnapshotIndex = 0
        return currentSnapshot
    }
    
    /// Cancel the whole chronology and start a new one with the given snapshot
    public func reboot(with snapshot: Snapshot) {
        snapshots = [snapshot]
        currentSnapshotIndex = 0
    }
    
}
