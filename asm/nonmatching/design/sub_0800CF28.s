	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800CF28
sub_0800CF28: @ 0x0800CF28
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_0800C840
	cmp r0, #0
	beq _0800CF48
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl SetTerrainAt
_0800CF48:
	ldr r0, _0800CFCC @ =gUnknown_08499590
	ldr r2, [r0]
	lsls r1, r5, #1
	ldr r3, _0800CFD0 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r3, r0, r4
	lsls r1, r3, #1
	ldr r6, _0800CFD4 @ =0x00000A22
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x86
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0800CF78
	ldr r1, _0800CFD8 @ =0x00001432
	adds r0, r2, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #4
	beq _0800CF9C
_0800CF78:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800CEF8
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x87
	bl sub_08007F14
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007D70
_0800CF9C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800CFDC
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800A588
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800ABD0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007F9C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800BEE4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CFCC: .4byte gUnknown_08499590
_0800CFD0: .4byte 0x0000417A
_0800CFD4: .4byte 0x00000A22
_0800CFD8: .4byte 0x00001432

