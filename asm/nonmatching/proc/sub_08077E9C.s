	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077E9C
sub_08077E9C: @ 0x08077E9C
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _08077ED4 @ =gUnknown_08615194
	ldr r4, _08077ED8 @ =gUnknown_0202FDFC
	ldr r0, [r4, #0xc]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r1, r2
	movs r2, #6
	ldrsh r0, [r1, r2]
	movs r5, #0
	ldrsh r2, [r4, r5]
	subs r0, r0, r2
	subs r0, #2
	movs r2, #8
	ldrsh r1, [r1, r2]
	movs r5, #2
	ldrsh r2, [r4, r5]
	subs r1, r1, r2
	adds r1, #7
	movs r2, #0x18
	bl sub_080758BC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077ED4: .4byte gUnknown_08615194
_08077ED8: .4byte gUnknown_0202FDFC

