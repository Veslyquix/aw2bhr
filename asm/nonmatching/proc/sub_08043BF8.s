	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043BF8
sub_08043BF8: @ 0x08043BF8
	push {lr}
	ldr r3, _08043C1C @ =gUnknown_084A0090
	lsls r2, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r1, #0x80
	ldr r2, _08043C20 @ =0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _08043C24 @ =0x06010000
	adds r1, r1, r2
	bl sub_08011CAC
	pop {r0}
	bx r0
	.align 2, 0
_08043C1C: .4byte gUnknown_084A0090
_08043C20: .4byte 0x000003FF
_08043C24: .4byte 0x06010000

