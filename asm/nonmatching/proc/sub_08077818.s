	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077818
sub_08077818: @ 0x08077818
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0807785C @ =gUnknown_0300064C
	ldr r0, [r0]
	movs r1, #0xa8
	subs r1, r1, r0
	movs r0, #0
	bl sub_08077620
	ldr r0, _08077860 @ =gUnknown_08499578
	ldr r0, [r0]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	ldr r1, _08077864 @ =gUnknown_08551A00
	ldr r1, [r1]
	movs r2, #0x1e
	movs r3, #7
	bl sub_08071900
	ldr r0, _08077868 @ =gUnknown_08499580
	ldr r0, [r0]
	adds r0, r0, r4
	ldr r1, _0807786C @ =gUnknown_08551A04
	ldr r1, [r1]
	movs r2, #0x1e
	movs r3, #7
	bl sub_08071900
	movs r0, #0
	str r0, [r5, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807785C: .4byte gUnknown_0300064C
_08077860: .4byte gUnknown_08499578
_08077864: .4byte gUnknown_08551A00
_08077868: .4byte gUnknown_08499580
_0807786C: .4byte gUnknown_08551A04

