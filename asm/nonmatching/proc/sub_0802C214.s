	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C214
sub_0802C214: @ 0x0802C214
	push {r4, r5, lr}
	ldr r0, _0802C250 @ =gUnknown_08499588
	ldr r0, [r0]
	ldr r1, _0802C254 @ =gUnknown_08499578
	ldr r1, [r1]
	movs r4, #0xe0
	lsls r4, r4, #2
	adds r1, r1, r4
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r2, r5, #0
	bl sub_0802C1F0
	ldr r0, _0802C258 @ =gUnknown_0849958C
	ldr r0, [r0]
	ldr r1, _0802C25C @ =gUnknown_08499580
	ldr r1, [r1]
	adds r1, r1, r4
	adds r2, r5, #0
	bl sub_0802C1F0
	movs r0, #0
	bl sub_08013AD4
	movs r0, #2
	bl sub_08013AD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C250: .4byte gUnknown_08499588
_0802C254: .4byte gUnknown_08499578
_0802C258: .4byte gUnknown_0849958C
_0802C25C: .4byte gUnknown_08499580

