	.include "macro.inc"
	.syntax unified
    

	thumb_func_start PutSprite
PutSprite: @ 0x0801BEBC
	push {r4, r5, r6, r7, lr}
	ldr r6, _0801BEF0 @ =gUnknown_03002B24
	ldr r5, [r6]
	ldr r4, _0801BEF4 @ =gUnknown_0200D510
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r4, [r0]
	str r4, [r5]
	ldr r7, _0801BEF8 @ =0x000001FF
	adds r4, r7, #0
	ands r1, r4
	strh r1, [r5, #4]
	movs r1, #0xff
	ands r2, r1
	strh r2, [r5, #6]
	mov r1, sp
	ldrh r1, [r1, #0x14]
	strh r1, [r5, #8]
	str r3, [r5, #0xc]
	str r5, [r0]
	adds r5, #0x10
	str r5, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801BEF0: .4byte gUnknown_03002B24
_0801BEF4: .4byte gUnknown_0200D510
_0801BEF8: .4byte 0x000001FF

