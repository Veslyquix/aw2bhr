	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F80C
sub_0803F80C: @ 0x0803F80C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r7, _0803F878 @ =gUnknown_080D3EE4
	ldr r5, _0803F87C @ =gUnknown_08091304
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, #0x1a]
	lsls r0, r0, #5
	adds r0, r0, r7
	adds r1, r4, #0
	adds r1, #0x10
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r7, #0
	adds r0, #0xc0
	adds r1, r4, #0
	adds r1, #0x15
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl ApplyPaletteExt
	mov r8, r5
	adds r4, #0x11
	movs r6, #0x3c
	movs r5, #3
_0803F84A:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #0x1a]
	lsls r0, r0, #5
	adds r0, r7, r0
	lsls r1, r4, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #1
	adds r6, #0x3c
	subs r5, #1
	cmp r5, #0
	bge _0803F84A
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F878: .4byte gUnknown_080D3EE4
_0803F87C: .4byte gUnknown_08091304

