	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805DFB8
sub_0805DFB8: @ 0x0805DFB8
	push {lr}
	ldr r0, _0805DFD4 @ =gUnknown_030040D8
	ldr r2, [r0]
	ldrb r1, [r2, #9]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0805DFE2
	ldrb r0, [r2]
	cmp r0, #7
	beq _0805DFD8
	cmp r0, #0x14
	beq _0805DFDE
	b _0805DFE2
	.align 2, 0
_0805DFD4: .4byte gUnknown_030040D8
_0805DFD8:
	bl sub_080598BC
	b _0805DFE2
_0805DFDE:
	bl sub_08059978
_0805DFE2:
	pop {r0}
	bx r0
	.align 2, 0

