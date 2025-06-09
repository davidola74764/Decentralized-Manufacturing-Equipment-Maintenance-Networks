;; Maintenance History Contract
;; Tracks equipment maintenance history

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-unauthorized (err u102))

;; Data structures
(define-map maintenance-records
  { equipment-id: uint, record-id: uint }
  {
    service-provider: principal,
    maintenance-type: (string-ascii 50),
    date: uint,
    cost: uint,
    parts-used: (list 10 uint),
    notes: (string-ascii 200)
  }
)

(define-map equipment-record-count { equipment-id: uint } uint)

;; Public functions
(define-public (add-maintenance-record
    (equipment-id uint)
    (service-provider principal)
    (maintenance-type (string-ascii 50))
    (cost uint)
    (parts-used (list 10 uint))
    (notes (string-ascii 200))
  )
  (let ((record-count (default-to u0 (map-get? equipment-record-count { equipment-id: equipment-id }))))
    (map-set maintenance-records
      { equipment-id: equipment-id, record-id: record-count }
      {
        service-provider: service-provider,
        maintenance-type: maintenance-type,
        date: block-height,
        cost: cost,
        parts-used: parts-used,
        notes: notes
      }
    )
    (map-set equipment-record-count
      { equipment-id: equipment-id }
      (+ record-count u1)
    )
    (ok record-count)
  )
)

;; Read-only functions
(define-read-only (get-maintenance-record (equipment-id uint) (record-id uint))
  (map-get? maintenance-records { equipment-id: equipment-id, record-id: record-id })
)

(define-read-only (get-equipment-record-count (equipment-id uint))
  (default-to u0 (map-get? equipment-record-count { equipment-id: equipment-id }))
)
