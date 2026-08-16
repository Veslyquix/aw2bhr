	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804C098
sub_0804C098: @ 0x0804C098
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, _0804C0D8 @ =gUnknown_085D6A48
	ldr r0, _0804C0DC @ =gUnknown_03004580
	lsls r1, r3, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #0x12]
	cmp r0, #0
	bne _0804C0D2
	lsls r1, r3, #0x1d
	lsrs r1, r1, #0x10
	ldr r0, _0804C0E0 @ =gUnknown_02029BA8
	lsls r2, r3, #5
	adds r0, #0x18
	adds r2, r2, r0
	ldr r0, [r2]
	ldr r2, _0804C0E4 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #6
	bl sub_08011C68
_0804C0D2:
	pop {r0}
	bx r0
	.align 2, 0
_0804C0D8: .4byte gUnknown_085D6A48
_0804C0DC: .4byte gUnknown_03004580
_0804C0E0: .4byte gUnknown_02029BA8
_0804C0E4: .4byte 0x06010000

