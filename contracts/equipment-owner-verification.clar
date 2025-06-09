;; Equipment Owner Verification Contract
;; Validates and manages manufacturing equipment owners

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-already-exists (err u102))
(define-constant err-unauthorized (err u103))

;; Data structures
(define-map verified-owners principal bool)
(define-map equipment-registry
  { equipment-id: uint }
  { owner: principal, verified: bool, registration-date: uint }
)

(define-data-var next-equipment-id uint u1)

;; Public functions
(define-public (verify-owner (owner principal))
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (map-set verified-owners owner true)
    (ok true)
  )
)

(define-public (register-equipment (owner principal))
  (let ((equipment-id (var-get next-equipment-id)))
    (asserts! (default-to false (map-get? verified-owners owner)) err-unauthorized)
    (map-set equipment-registry
      { equipment-id: equipment-id }
      {
        owner: owner,
        verified: true,
        registration-date: block-height
      }
    )
    (var-set next-equipment-id (+ equipment-id u1))
    (ok equipment-id)
  )
)

;; Read-only functions
(define-read-only (is-owner-verified (owner principal))
  (default-to false (map-get? verified-owners owner))
)

(define-read-only (get-equipment-info (equipment-id uint))
  (map-get? equipment-registry { equipment-id: equipment-id })
)

(define-read-only (get-next-equipment-id)
  (var-get next-equipment-id)
)
