	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019A0C
sub_08019A0C: @ 0x08019A0C
	push {r4, r5, r6, lr}
	ldr r6, _08019A50 @ =gUnknown_030030CC
	ldrb r4, [r6, #1]
	movs r5, #0x20
	orrs r4, r5
	strb r4, [r6, #1]
	ldr r5, _08019A54 @ =0x04000040
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r0, #8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r0, r2
	orrs r4, r0
	strh r4, [r5]
	ldr r2, _08019A58 @ =0x04000044
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #8
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r1, r1, r3
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08019A5C @ =0x04000048
	movs r0, #0x3f
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x1f
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08019A50: .4byte gUnknown_030030CC
_08019A54: .4byte 0x04000040
_08019A58: .4byte 0x04000044
_08019A5C: .4byte 0x04000048

