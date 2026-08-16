	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031F88
sub_08031F88: @ 0x08031F88
	push {lr}
	adds r1, r0, #0
	ldr r0, _08031FAC @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #3
	bne _08031FA6
	ldr r0, [r1, #0x58]
	adds r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08031FB0 @ =gUnknown_02000000
	ldr r2, _08031FB4 @ =0x00000724
	bl sub_0801A7D8
_08031FA6:
	pop {r0}
	bx r0
	.align 2, 0
_08031FAC: .4byte gUnknown_0849B018
_08031FB0: .4byte gUnknown_02000000
_08031FB4: .4byte 0x00000724

