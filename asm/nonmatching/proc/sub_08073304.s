	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073304
sub_08073304: @ 0x08073304
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov r8, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x20]
	ldr r0, [sp, #0x24]
	ldr r7, [sp, #0x28]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08073394 @ =gUnknown_081CC038
	bl Decompress
	ldr r0, _08073398 @ =gUnknown_081D2224
	adds r1, r5, #0
	adds r1, #0x10
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807339C @ =gUnknown_086140D4
	adds r1, r7, #0
	bl Proc_Start
	adds r7, r0, #0
	mov r0, sb
	mov r1, r8
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_08073228
	adds r1, r7, #0
	adds r1, #0x54
	movs r0, #0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x5c
	movs r1, #0
	strh r4, [r0]
	adds r0, #2
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #9
	strb r1, [r0]
	mov r0, sl
	cmp r0, #0
	beq _08073380
	movs r0, #1
	rsbs r0, r0, #0
_08073380:
	str r0, [r7, #0x64]
	adds r0, r7, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08073394: .4byte gUnknown_081CC038
_08073398: .4byte gUnknown_081D2224
_0807339C: .4byte gUnknown_086140D4

