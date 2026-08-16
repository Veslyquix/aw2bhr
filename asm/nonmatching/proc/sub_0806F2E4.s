	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F2E4
sub_0806F2E4: @ 0x0806F2E4
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	adds r2, r0, #1
	str r2, [r1, #0x58]
	ldr r0, [r1, #0x5c]
	cmp r0, #0
	beq _0806F306
	cmp r2, #0x1e
	ble _0806F300
	movs r0, #0
	str r0, [r1, #0x5c]
	str r0, [r1, #0x58]
_0806F300:
	ldr r0, [r1, #0x5c]
	cmp r0, #0
	bne _0806F328
_0806F306:
	ldr r0, [r1, #0x58]
	cmp r0, #0x3c
	ble _0806F314
	movs r0, #1
	str r0, [r1, #0x5c]
	movs r0, #0
	str r0, [r1, #0x58]
_0806F314:
	ldr r0, [r1, #0x5c]
	cmp r0, #0
	bne _0806F328
	ldr r3, _0806F330 @ =gUnknown_08582C8C
	str r0, [sp]
	movs r0, #0
	movs r1, #0x48
	movs r2, #0x38
	bl sub_0801BEBC
_0806F328:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0806F330: .4byte gUnknown_08582C8C

