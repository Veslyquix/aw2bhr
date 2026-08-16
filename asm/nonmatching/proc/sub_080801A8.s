	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080801A8
sub_080801A8: @ 0x080801A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08080240 @ =gUnknown_081D9384
	mov sl, r0
	ldr r1, _08080244 @ =gUnknown_02010050
	mov sb, r1
	movs r7, #0x80
	lsls r7, r7, #1
	movs r4, #0xc0
	lsls r4, r4, #0x13
	movs r5, #3
_080801C4:
	ldr r6, _08080248 @ =gUnknown_03002B6C
	ldr r1, [r6]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	adds r1, r1, r4
	mov r0, sb
	adds r2, r7, #0
	bl CpuFastSet
	mov r0, sl
	ldr r0, [r0]
	mov r8, r0
	ldr r1, [r0]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	adds r1, r1, r4
	mov r0, sb
	adds r2, r7, #0
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #3
	adds r4, r4, r1
	subs r5, #1
	cmp r5, #0
	bge _080801C4
	ldr r4, _0808024C @ =gUnknown_0200FC50
	ldr r1, [r6]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x80
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #2
	adds r4, r4, r0
	mov r0, r8
	ldr r1, [r0]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	ldr r0, _08080250 @ =0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x80
	bl CpuFastSet
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080240: .4byte gUnknown_081D9384
_08080244: .4byte gUnknown_02010050
_08080248: .4byte gUnknown_03002B6C
_0808024C: .4byte gUnknown_0200FC50
_08080250: .4byte 0x06000200

