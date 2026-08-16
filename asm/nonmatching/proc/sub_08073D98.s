	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073D98
sub_08073D98: @ 0x08073D98
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	bl sub_080703F4
	movs r1, #0
	str r1, [r4, #0x58]
	ldr r2, _08073DFC @ =gUnknown_0202FDE8
	ldr r0, _08073E00 @ =gUnknown_0202FDEA
	strh r1, [r0]
	strh r1, [r2]
	ldr r0, _08073E04 @ =gUnknown_030030A4
	mov r8, r0
	ldrb r1, [r0, #1]
	movs r0, #2
	rsbs r0, r0, #0
	adds r2, r0, #0
	ands r2, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r2, r1
	movs r6, #4
	orrs r2, r6
	movs r5, #8
	orrs r2, r5
	movs r4, #0x10
	orrs r2, r4
	ldr r3, _08073E08 @ =gUnknown_030030DC
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	strb r0, [r3]
	movs r1, #0x20
	orrs r2, r1
	mov r0, r8
	strb r2, [r0, #1]
	ldrb r0, [r3, #1]
	orrs r0, r1
	strb r0, [r3, #1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073DFC: .4byte gUnknown_0202FDE8
_08073E00: .4byte gUnknown_0202FDEA
_08073E04: .4byte gUnknown_030030A4
_08073E08: .4byte gUnknown_030030DC

