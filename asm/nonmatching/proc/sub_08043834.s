	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043834
sub_08043834: @ 0x08043834
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804387C @ =gUnknown_030005D0
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08043880 @ =gUnknown_08102824
	ldr r1, _08043884 @ =0x06010000
	movs r2, #0xe8
	lsls r2, r2, #3
	bl sub_08011E54
	ldr r2, _08043888 @ =gUnknown_08104264
	ldr r0, _0804388C @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x1a]
	subs r0, #1
	lsls r0, r0, #5
	adds r0, r0, r2
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _08043890 @ =gUnknown_081259CC
	ldr r1, _08043894 @ =0x06010840
	movs r2, #0xc0
	bl sub_08011E54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804387C: .4byte gUnknown_030005D0
_08043880: .4byte gUnknown_08102824
_08043884: .4byte 0x06010000
_08043888: .4byte gUnknown_08104264
_0804388C: .4byte gUnknown_08499598
_08043890: .4byte gUnknown_081259CC
_08043894: .4byte 0x06010840

