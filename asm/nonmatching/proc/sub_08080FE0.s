	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080FE0
sub_08080FE0: @ 0x08080FE0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r4, #0
	ldr r0, _08081054 @ =gUnknown_081D9394
	mov sb, r0
	ldr r1, [r0]
	mov r8, r1
	ldr r6, _08081058 @ =0x024A0000
_08080FF6:
	adds r0, r4, #0
	bl sub_08084858
	lsls r0, r0, #0x18
	adds r5, r7, #0
	adds r5, #0x64
	cmp r0, #0
	beq _0808101C
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	add r0, r8
	lsrs r1, r6, #0x10
	movs r2, #0x10
	bl ApplyPaletteExt
_0808101C:
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r6, r6, r0
	adds r4, #1
	cmp r4, #5
	ble _08080FF6
	mov r1, sb
	ldr r2, [r1]
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _0808105C @ =0x0000030A
	movs r2, #0x10
	bl ApplyPaletteExt
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081054: .4byte gUnknown_081D9394
_08081058: .4byte 0x024A0000
_0808105C: .4byte 0x0000030A

