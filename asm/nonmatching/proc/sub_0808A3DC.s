	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A3DC
sub_0808A3DC: @ 0x0808A3DC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r6, _0808A45C @ =gUnknown_081D9478
	ldr r4, [r6]
	ldr r1, [r4]
	ldr r2, _0808A460 @ =0x01000400
	mov r0, sp
	bl CpuSet
	ldr r0, _0808A464 @ =gUnknown_0823E7A0
	ldr r5, _0808A468 @ =gUnknown_081D947C
	ldr r1, [r5]
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _0808A46C @ =0x06000400
	adds r1, r1, r2
	bl Decompress
	ldr r0, _0808A470 @ =gUnknown_0823E684
	ldr r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r1, r2
	bl Decompress
	movs r2, #0
	ldr r3, _0808A474 @ =0x000003FF
_0808A41C:
	ldr r0, [r4]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r7, #0x81
	lsls r7, r7, #5
	adds r0, r0, r7
	strh r0, [r1]
	adds r2, #1
	cmp r2, r3
	ble _0808A41C
	movs r0, #3
	movs r1, #1
	bl sub_0802D5CC
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r1, [r5]
	ldr r1, [r1]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	ldr r2, _0808A478 @ =0x06000800
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A45C: .4byte gUnknown_081D9478
_0808A460: .4byte 0x01000400
_0808A464: .4byte gUnknown_0823E7A0
_0808A468: .4byte gUnknown_081D947C
_0808A46C: .4byte 0x06000400
_0808A470: .4byte gUnknown_0823E684
_0808A474: .4byte 0x000003FF
_0808A478: .4byte 0x06000800

