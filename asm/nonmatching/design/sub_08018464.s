	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018464
sub_08018464: @ 0x08018464
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r4, r1, #0
	ldr r0, _0801849C @ =gUnknown_03002514
	ldrb r0, [r0]
	cmp r0, #1
	beq _0801847C
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	bl sub_08018254
_0801847C:
	ldr r2, _080184A0 @ =gUnknown_0200C528
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801849C: .4byte gUnknown_03002514
_080184A0: .4byte gUnknown_0200C528

